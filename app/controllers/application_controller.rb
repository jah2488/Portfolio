class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prep_mobile


  private

  def mobile_device?
    request.user_agent =~ /Mobile|webOS|iPhone/
  end

  helper_method :mobile_device?

  def prep_mobile
    prepend_view_path "app/views/mobile" if mobile_device?
  end
end
