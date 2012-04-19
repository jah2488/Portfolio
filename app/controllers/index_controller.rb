class IndexController < ApplicationController

  def index
    @post = Post.last if Post.count > 0
    @projects = Project.descending(:start_date).limit(3) if Project.count > 0
  end

  def contact
  end

end
