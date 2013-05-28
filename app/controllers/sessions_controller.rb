class SessionsController < ApplicationController
  skip_before_filter :check_authentication
  
  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path
    else
      redirect_to login_path, alert: 'Username/password mismatch!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
