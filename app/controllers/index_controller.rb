class IndexController < ApplicationController

  def index
  	@post = Post.last
  	@project = Project.last
  end

end
