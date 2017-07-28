class ArrowsController < ApplicationController
  before_action :set_arrow, only: [:show, :edit, :update, :destroy]

  # GET /arrows
  # GET /arrows.json
  def index
    @arrows = Arrow.all
  end

  # GET /arrows/1
  # GET /arrows/1.json
  def show
  end

  # GET /arrows/new
  def new
    @arrow = Arrow.new
  end

  # GET /arrows/1/edit
  def edit
  end

  # POST /arrows
  # POST /arrows.json
  def create
    @arrow = Arrow.new(arrow_params)

    respond_to do |format|
      if @arrow.save
        format.html { redirect_to @arrow, notice: 'Arrow was successfully created.' }
        format.json { render :show, status: :created, location: @arrow }
      else
        format.html { render :new }
        format.json { render json: @arrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arrows/1
  # PATCH/PUT /arrows/1.json
  def update
    respond_to do |format|
      if @arrow.update(arrow_params)
        format.html { redirect_to @arrow, notice: 'Arrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrow }
      else
        format.html { render :edit }
        format.json { render json: @arrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrows/1
  # DELETE /arrows/1.json
  def destroy
    @arrow.destroy
    respond_to do |format|
      format.html { redirect_to arrows_url, notice: 'Arrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrow
      @arrow = Arrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrow_params
      params.require(:arrow).permit(:score_id, :value)
    end
end
