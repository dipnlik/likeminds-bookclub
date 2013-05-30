class ApplicationController < ActionController::Base
  before_filter :check_authentication
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
  private
  
  def check_authentication
    redirect_to login_url, alert: 'Please log in' unless User.find_by_id(session[:user_id])
  end
end
