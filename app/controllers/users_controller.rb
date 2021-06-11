class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_login, only: %i[index show edit update destroy]

  def show
    @user = User.find(params[:id])
    @yell = Yell.new
    @yells = Yell.all
  end

  def new
    redirect_to homepage_url if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to homepage_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:error] = 'There was an error in your sign up process!'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow
    @user = User.find(params[:id])
    @follow = current_user.followers.build(followed: @user)

    if @follow.save
      flash[:success] = 'You followed successfully!!'
    else
      flash[:alert] = 'Something went wrong with your following...'
    end

    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    @follow = Following.find_by(followed: @user, follower: current_user)

    unless @follow.nil?
      @follow.destroy
      flash[:notice] = 'You unfollowed the person sucessfully!'
    end

    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end
end
