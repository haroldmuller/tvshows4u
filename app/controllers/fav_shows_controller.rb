class FavShowsController < ApplicationController
  before_action :set_fav_show, only: [:show, :edit, :update, :destroy]

  # GET /fav_shows
  # GET /fav_shows.json
  def index
    @fav_shows = FavShow.all
  end

  # GET /fav_shows/1
  # GET /fav_shows/1.json
  def show
  end

  # GET /fav_shows/new
  def new
    @fav_show = FavShow.new
  end

  # GET /fav_shows/1/edit
  def edit
  end

  # POST /fav_shows
  # POST /fav_shows.json
  def create
    @fav_show = FavShow.new(:user_id => current_user.id, :tv_show_id => params["tv_show_id"].to_i, :favorite => true)
    @tv_show = TvShow.find(params["tv_show_id"].to_i)
    respond_to do |format|
      if @fav_show.save
        format.html { redirect_to @tv_show, notice: 'Fav show was successfully created.' }
        format.json { render :show, status: :created, location: @fav_show }
      else
        format.html { render :new }
        format.json { render json: @fav_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fav_shows/1
  # PATCH/PUT /fav_shows/1.json
  def update
    respond_to do |format|
      if @fav_show.update(fav_show_params)
        format.html { redirect_to @fav_show, notice: 'Fav show was successfully updated.' }
        format.json { render :show, status: :ok, location: @fav_show }
      else
        format.html { render :edit }
        format.json { render json: @fav_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fav_shows/1
  # DELETE /fav_shows/1.json
  def destroy
    @fav_show.destroy
    respond_to do |format|
      format.html { redirect_to fav_shows_url, notice: 'Fav show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fav_show
      @fav_show = FavShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fav_show_params
      params.require(:fav_show).permit(:user_id, :tv_show_id, :favorite)
    end
end
