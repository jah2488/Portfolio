class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /projects
  # GET /projects.json
  def index
    if params[:query]
      @projects = Project.search(params[:query])
    else
      @projects = Project.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def tagged
    @projects = Project.any_of({ language: params[:tag] },
                               { platform: params[:tag] })
    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find_by_slug(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.start_date = set_start_date
    @project.end_date   = set_end_date
    binding.pry if Rails.env.development?
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find_by_slug(params[:id])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find_by_slug(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end

  def set_start_date
    params[:project][:start_date] = params[:project][:"start_date(1i)"] + "-" + params[:project][:"start_date(2i)"] + "-" + params[:project][:"start_date(3i)"]
  end
  def set_end_date
      params[:project][:end_date] = params[:project][:"end_date(1i)"] + "-" + params[:project][:"end_date(2i)"] + "-" + params[:project][:"end_date(3i)"]
  end
end
