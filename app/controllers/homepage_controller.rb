class HomepageController < ApplicationController
  before_action :require_login, only: %i[ index show edit update destroy ]
  
  def index
    @users = User.all.order(created_at: :desc)
    @user = User.find(session[:user_id])
    @yell = Yell.new
    @yells = Yell.all.order(created_at: :desc)
  end
end
