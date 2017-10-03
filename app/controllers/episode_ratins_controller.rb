class EpisodeRatinsController < ApplicationController
  before_action :set_episode_ratin, only: [:show, :edit, :update, :destroy]

  # GET /episode_ratins
  # GET /episode_ratins.json
  def index
    @episode_ratins = EpisodeRatin.all
  end

  # GET /episode_ratins/1
  # GET /episode_ratins/1.json
  def show
  end

  # GET /episode_ratins/new
  def new
    @episode_ratins = EpisodeRatin.all
    @episode_ratin = EpisodeRatin.new(:episode_id => params[:episode_id], :user_id => params[:user_id])

  end

  # GET /episode_ratins/1/edit
  def edit
  end

  # POST /episode_ratins
  # POST /episode_ratins.json
  def create
    @episode_ratin = EpisodeRatin.new(episode_ratin_params)
    if @episode_ratin.rating > 5
      @episode_ratin.rating = 5
    elsif @episode_ratin.rating < 0
      @episode_ratin.rating = 0
    end
    respond_to do |format|
      if @episode_ratin.save
        format.html { redirect_to @episode_ratin, notice: 'Episode ratin was successfully created.' }
        format.json { render :show, status: :created, location: @episode_ratin }
      else
        format.html { render :new }
        format.json { render json: @episode_ratin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episode_ratins/1
  # PATCH/PUT /episode_ratins/1.json
  def update
    hash =  episode_ratin_params
    if hash["rating"].to_i > 5
      hash["rating"] = 5
    elsif hash["rating"].to_i < 0
      hash["rating"] = 0
    end
    puts hash["rating"]
    respond_to do |format|
      if @episode_ratin.update(hash)
        format.html { redirect_to @episode_ratin, notice: 'Episode ratin was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode_ratin }
      else
        format.html { render :edit }
        format.json { render json: @episode_ratin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episode_ratins/1
  # DELETE /episode_ratins/1.json
  def destroy
    @episode_ratin.destroy
    respond_to do |format|
      format.html { redirect_to episode_ratins_url, notice: 'Episode ratin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode_ratin
      @episode_ratin = EpisodeRatin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_ratin_params
      params.require(:episode_ratin).permit(:rating, :favorite, :seen, :user_id, :episode_id)
    end
end
