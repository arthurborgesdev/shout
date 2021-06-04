class YellsController < ApplicationController
  before_action :set_yell, only: %i[ show edit update destroy ]

  # GET /yells or /yells.json
  def index
    @yells = Yell.all
  end

  # GET /yells/1 or /yells/1.json
  def show
  end

  # GET /yells/new
  def new
    @yell = Yell.new
  end

  # GET /yells/1/edit
  def edit
  end

  # POST /yells or /yells.json
  def create
    @yell = Yell.new(yell_params)

    respond_to do |format|
      if @yell.save
        format.html { redirect_to @yell, notice: "Yell was successfully created." }
        format.json { render :show, status: :created, location: @yell }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @yell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yells/1 or /yells/1.json
  def update
    respond_to do |format|
      if @yell.update(yell_params)
        format.html { redirect_to @yell, notice: "Yell was successfully updated." }
        format.json { render :show, status: :ok, location: @yell }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yells/1 or /yells/1.json
  def destroy
    @yell.destroy
    respond_to do |format|
      format.html { redirect_to yells_url, notice: "Yell was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yell
      @yell = Yell.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yell_params
      params.require(:yell).permit(:user_id, :text)
    end
end
