class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:index, :admin]
  before_action :set_tv_shows, only: [:admin]

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @tv_shows = TvShow.where(user_id: params[:id]).order(created_at: :desc)
    @tv_shows = @tv_shows[0,4]

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin
    @tv_shows = TvShow.all
    @users = User.all
    @episodes = Episode.all
  end

  def finish_signup
    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
      @user = User.find(params[:id])

      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
      else
        @show_errors = true
      end
    end
  end

  def favorite
    @series = FavShow.all
    @series_fav = []
    @tv_shows = TvShow.all
    @genders = Gender.all
    @directors = Director.all
    if user_signed_in?
      for i in @series
        if i.user_id == current_user.id and i.favorite
          @series_fav << @tv_shows.find(i.tv_show_id.to_i)
        end
      end
    end

    @episodes = FavEpisode.all
    @episodes_fav = []
    @tv_episodes = Episode.all
    if user_signed_in?
      for i in @episodes
        if i.user_id == current_user.id and i.favorite
          @episodes_fav << @tv_episodes.find(i.episode_id.to_i)
        end
      end
    end
  end

  private
    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(:first_name, :last_name, :role, :avatar, :email, accessible)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_users
      @users = User.all.sort_by{|e| [e.role, e.last_name, e.first_name]}
    end

    def set_tv_shows
      @tv_shows = TvShow.all.sort_by{|e| [e.name, e.country]}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :avatar)
    end
end
