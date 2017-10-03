class FavEpisodesController < ApplicationController
  before_action :set_fav_episode, only: [:show, :edit, :update, :destroy]

  # GET /fav_episodes
  # GET /fav_episodes.json
  def index
    @fav_episodes = FavEpisode.all
  end

  # GET /fav_episodes/1
  # GET /fav_episodes/1.json
  def show
  end

  # GET /fav_episodes/new
  def new
    @fav_episode = FavEpisode.new
  end

  # GET /fav_episodes/1/edit
  def edit
  end

  # POST /fav_episodes
  # POST /fav_episodes.json
  def create
    @fav_episode = FavEpisode.new(:user_id => params["user_id"].to_i, :episode_id => params["episode_id"].to_i, :favorite => true)
    respond_to do |format|
      if @fav_episode.save
        format.html { redirect_to '/user/favorite', notice: 'Fav episode was successfully created.' }
        format.json { render :show, status: :created, location: @fav_episode }
      else
        format.html { render :new }
        format.json { render json: @fav_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fav_episodes/1
  # PATCH/PUT /fav_episodes/1.json
  def update
    respond_to do |format|
      if @fav_episode.update(fav_episode_params)
        format.html { redirect_to @fav_episode, notice: 'Fav episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @fav_episode }
      else
        format.html { render :edit }
        format.json { render json: @fav_episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fav_episodes/1
  # DELETE /fav_episodes/1.json
  def destroy
    @fav_episode.destroy
    respond_to do |format|
      format.html { redirect_to fav_episodes_url, notice: 'Fav episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fav_episode
      @fav_episode = FavEpisode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fav_episode_params
      params.require(:fav_episode).permit(:user_id, :episode_id, :favorite)
    end
end
