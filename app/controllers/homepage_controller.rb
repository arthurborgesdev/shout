class HomepageController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @followers = @user.followers.count
    @followeds = @user.followeds.count
  end
end
