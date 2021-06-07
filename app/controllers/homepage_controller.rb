class HomepageController < ApplicationController
  before_action :require_login, only: %i[ index show edit update destroy ]
  
  def index
    @user = User.find(session[:user_id])
    @yell = Yell.new
    @yells = Yell.all
  end
end
