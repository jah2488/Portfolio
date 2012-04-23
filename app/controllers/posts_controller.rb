class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :feed]

  def index
    @posts = Post.descending(:pubdate)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def tagged
    @posts = Post.any_of({ category: params[:tag] },
                               { type: params[:tag] })
    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find_by_slug(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end

  def feed
    @posts = Post.all.order("posted_at DESC").limit(20)
    @updated = @posts.first.updated_at unless @posts.empty?
    respond_to do |format|
      format.atom { render layout: false}
      format.rss  { redirect_to feed_path(format: :atom), status: :moved_permanently}
    end
  end
end
