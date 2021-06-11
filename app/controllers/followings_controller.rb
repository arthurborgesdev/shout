class FollowingsController < ApplicationController
  before_action :set_following, only: %i[show edit update destroy]

  def index
    @followings = Following.all
  end

  def show; end

  def new
    @following = Following.new
  end

  def edit; end

  def create
    @following = Following.new(following_params)

    respond_to do |format|
      if @following.save
        format.html { redirect_to @following, notice: 'Following was successfully created.' }
        format.json { render :show, status: :created, location: @following }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @following.update(following_params)
        format.html { redirect_to @following, notice: 'Following was successfully updated.' }
        format.json { render :show, status: :ok, location: @following }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @following.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @following.destroy
    respond_to do |format|
      format.html { redirect_to followings_url, notice: 'Following was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_following
    @following = Following.find(params[:id])
  end

  def following_params
    params.fetch(:following, {})
  end
end
