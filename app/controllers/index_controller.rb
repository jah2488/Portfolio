class IndexController < ApplicationController

  def index
  	@post = Post.last
  	@projects = Project.descending(:start_date).limit(4)
  end

  def contact
  end

end
