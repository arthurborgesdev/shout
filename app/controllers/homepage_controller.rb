class HomepageController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @followers_count = @user.followers.count
    @followeds_count = @user.followeds.count
    @yell = Yell.new
    @yells = Yell.all
  end
end
