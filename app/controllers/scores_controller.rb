class ScoresController < ApplicationController
  #layout 'app'
  before_action :authenticate_user!
  before_action :set_score, only: [:show, :edit, :update, :destroy, :puntuar, :add_arrows, :finish]
  before_action :set_contadores, only: [:index, :show, :puntuar]

  def finish
    if @score.score_type.num_rounds > @score.actual_round 
      @score.actual_round += 1
      @score.save
    else 
      @score.ended!
    end
    redirect_to @score
  end

  def puntuar
    @arrows = @score.arrows(@score.actual_round)
  end

  def add_arrows
    params[:arrow].each_pair do |param,arrow|
      value = Arrow.get_arrow_value(arrow)
      Arrow.create(score_id: @score.id, value: value, arrow: arrow, round: params[:round])
      # acutalizamos datos del score
      @score.points += value
      @score.x_count += 1 if arrow == 'X'
      @score.ten_count += 1 if arrow == '10'
      @score.nine_count += 1 if value == 9
      @score.average = (@score.points.to_f / @score.arrows.count.to_f).to_f.round(2)
      @score.save
    end
    @arrows = @score.arrows(params[:round])
    if @arrows.count == @score.score_type.arrows
      @time_to_finish = true
    else
      @time_to_finish = false 
    end
  end

  # GET /scores
  # GET /scores.json
  def index
    if current_user.has_role? :admin
      @all = Score.not_deleted
    else
      @all = current_user.scores.not_deleted
    end
    @started = @all.started
    @ended = @all.ended
    @state = params[:state].to_i unless params[:state].blank?
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
    @arrows = @score.arrows
  end

  # GET /scores/new
  def new
    @score = Score.new()
    @scores = current_user.scores.started
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)
    @score.name = @score.score_type.name + ' - ' + DateTime.now.strftime('%Y-%m-%d %H:%M') if @score.name.blank?
    @score.user_id = current_user.id
    respond_to do |format|
      if @score.save
        format.html { redirect_to puntuar_score_path(@score) }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    redirect_to action: :index, status: 303, notice: 'Score was successfully destroyed.'
  end

  private
    def set_contadores
      @num_started_scores = current_user.scores.started.count 
      @num_scores = current_user.scores.count
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
      @score_type = @score.score_type
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:name, :score_type_id, :user_id, :state, :published, :points, :average, :x_count, :ten_count, :nine_count)
    end
end
