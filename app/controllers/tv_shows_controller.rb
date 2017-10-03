class TvShowsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :update, :destroy]
  before_action :set_tv_show, only: [:show, :edit, :update, :destroy]
  before_action :set_basics

  # GET /tv_shows
  # GET /tv_shows.json
  def index

    @tv_shows = TvShow.all.order('name ASC')
    @noticias_admin = Notice.all

    if params[:find_by]
      if params[:find_by] == 'director'
        splitted = params[:search].split(' ')

        director_ids = []
        if splitted[1]
          director_id_1 = Director.find_by(:last_name => splitted[1])
          director_ids << director_id_1 if director_id_1 != nil
          director_id_2 = Director.find_by(:first_name => splitted[0])
          director_ids << director_id_2 if director_id_2 != nil
          director_id_3 = Director.find_by(:last_name => splitted[0])
          director_ids << director_id_3 if director_id_3 != nil
          director_id_4 = Director.find_by(:first_name => splitted[1])
          director_ids << director_id_4 if director_id_4 != nil
        else
          director_id_1 = Director.find_by(:last_name => splitted[0])
          director_ids << director_id_1 if director_id_1 != nil
          director_id_2 = Director.find_by(:first_name => splitted[0])
          director_ids << director_id_2 if director_id_2 != nil
        end

        params[:director_id_1] = director_ids[0] if director_ids[0]

        params[:director_id_2] = director_ids[1] if director_ids[1]

        params[:director_id_3] = director_ids[2] if director_ids[2]

        params[:director_id_4] = director_ids[3] if director_ids[3]
        @tv_shows = TvShow.search_by_director(params).order('name ASC')

      elsif params[:find_by] == 'gender'
        gender = Gender.find_by(:gender => params[:search])
        params[:gender_id] = gender
        @tv_shows = TvShow.search_by_gender(params).order('name ASC')
      end

    elsif params[:search]
      @tv_shows = TvShow.name_contains(params[:search]).order('name ASC') #Cuando se busca por nombre
    end

    @user = current_user
    if user_signed_in?
      if @user.sign_in_count == 1
        UserMailer.welcome_email(@user).deliver
      end
    end
  end

  # GET /tv_shows/1
  # GET /tv_shows/1.json
  def show
    @favs = FavShow.all
    if @tv_show.director_id
      @director = Director.find(@tv_show.director_id)
    end
    if @tv_show.gender_id
      @gender = Gender.find(@tv_show.gender_id)
    end
    @imdb = get_imdb(@tv_show.name)

  end

  # GET /tv_shows/new
  def new
    @url = tv_shows_path
    @tv_show = TvShow.new
  end

  # GET /tv_shows/1/edit
  def edit
    @url = tv_show_path
  end

  # POST /tv_shows
  # POST /tv_shows.json
  def create
    @tv_show = TvShow.new(tv_show_params)

    respond_to do |format|
      if @tv_show.save
        format.html { redirect_to @tv_show, notice: 'Tv show was successfully created.' }
        format.json { render :show, status: :created, location: @tv_show }
      else
        format.html { render :new }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tv_shows/1
  # PATCH/PUT /tv_shows/1.json
  def update
    respond_to do |format|
      if @tv_show.update(tv_show_params)
        format.html { redirect_to @tv_show, notice: 'Tv show was successfully updated.' }
        format.json { render :show, status: :ok, location: @tv_show }
      else
        format.html { render :edit }
        format.json { render json: @tv_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tv_shows/1
  # DELETE /tv_shows/1.json
  def destroy
    @tv_show.destroy
    respond_to do |format|
      format.html { redirect_to tv_shows_url, notice: 'Tv show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show
      @tv_show = TvShow.find(params[:id])
    end

    def set_basics
      @tv_show_comments = TvShowComment.all
      @users = User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tv_show_params
      params.require(:tv_show).permit(:name, :description, :country, :language,
      :cover, :user_id, :gender_id, :director_id, :url, :final_url)
    end

    def get_imdb(title)
      imdb = ImdbParty::Imdb.new
      imdb = ImdbParty::Imdb.new(:anonymize => true)
      begin
        response_id = imdb.find_by_title(title)[1][:imdb_id]
        movie = imdb.find_movie_by_id(response_id)
        res = [movie.rating, movie.certification]
        puts res
        res
      rescue
        []
      end
    end
end
