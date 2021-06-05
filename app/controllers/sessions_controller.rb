class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "You're logged in!"
      redirect_to homepage_url
    else
      flash[:error] = "This user does not exists!!"
      redirect_to login_url
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully logged out."
    redirect_to root_url
  end
end
