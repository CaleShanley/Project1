class SessionController < ApplicationController
  def new
  end

  def create
    # search the database for the user with email params[:email]
    user = User.find_by :email => params[:email]
    # if user exists && passwords match
    if user.present? && user.authenticate(params[:password])
      # remember the user
      session[:user_id] = user.id
      # redirec to home
      redirect_to root_path
    else
      flash[:error] = "Invalid Email or Password"
      redirect_to login_path
      # redirec to login
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to login_path
  end
end
