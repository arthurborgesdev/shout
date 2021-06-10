class YellsController < ApplicationController
  # GET /yells or /yells.json
  def index
    @yells = Yell.all
  end

  # GET /yells/1 or /yells/1.json
  def show; end

  # GET /yells/new
  def new
    @yell = Yell.new
  end

  # GET /yells/1/edit
  def edit; end

  # POST /yells or /yells.json
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

  # PATCH/PUT /yells/1 or /yells/1.json
  def update
    respond_to do |format|
      if @yell.update(yell_params)
        format.html { redirect_to @yell, notice: 'Yell was successfully updated.' }
        format.json { render :show, status: :ok, location: @yell }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yells/1 or /yells/1.json
  def destroy
    @yell = Yell.find(params[:id])
    @user = @yell.author

    @yell.destroy

    flash[:notice] = 'You successfuly removed the yell!'

    redirect_to user_path(@user)
  end

  private

  # Only allow a list of trusted parameters through.
  def yell_params
    params.require(:yell).permit(:user_id, :text)
  end
end
