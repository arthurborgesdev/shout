class SessionsController < ApplicationController
  def new
    redirect_to homepage_url if logged_in?
  end

  def create
    redirect_to homepage_url if logged_in?
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

  def welcome
    redirect_to homepage_url if logged_in?
  end

  def destroy
    if logged_in?
      session.delete(:user_id)
      flash[:success] = "You have successfully logged out."
    end
    redirect_to root_url
  end
end
