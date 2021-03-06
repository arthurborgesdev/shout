class YellsController < ApplicationController
  def index
    @yells = Yell.all
  end

  def new
    @yell = Yell.new
  end

  def create
    @yell = Yell.new(text: params['yell']['text'].upcase, author_id: session[:user_id])

    respond_to do |format|
      if @yell.save
        format.html { redirect_to homepage_url, notice: 'Yell was successfully created.' }
        format.json { render :show, status: :created, location: @yell }
      else
        format.html { redirect_to homepage_url, notice: 'There was a problem with your yell!' }
        format.json { render json: @yell.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @yell = Yell.find(params[:id])
    @user = @yell.author

    @yell.destroy

    flash[:notice] = 'You successfuly removed the yell!'

    redirect_to user_path(@user)
  end

  private

  def yell_params
    params.require(:yell).permit(:user_id, :text)
  end
end
