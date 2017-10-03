class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  before_action :set_tv_show

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode_comments = EpisodeComment.all
    @users = User.all
    @favs = FavEpisode.all
  end

  # GET /episodes/new
  def new
    @url = tv_show_episodes_path
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
    @url = tv_show_episode_path
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)
    respond_to do |format|
      if @tv_show.episodes << @episode
        format.html { redirect_to tv_show_path(@tv_show), notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    hash =  episode_params
    if hash["rating"].to_i > 5
      hash["rating"] = 5
    elsif hash["rating"].to_i < 0
      hash["rating"] = 0
    end
    respond_to do |format|
      if @episode.update(hash)
        format.html { redirect_to tv_show_path(@tv_show), notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to tv_show_path(@tv_show), notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    def set_tv_show
      @tv_show = TvShow.find(params[:tv_show_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:name, :season, :description, :duration, :release_year, :tv_show_id, :seen, :favorite, :rating)
    end
end
