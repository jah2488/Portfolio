class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @posts    = Post.all
    @projects = Project.all
  end

end
