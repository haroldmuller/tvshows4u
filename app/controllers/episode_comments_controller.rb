class EpisodeCommentsController < ApplicationController
  before_action :set_episode_comment, only: [:show, :edit, :update, :destroy]

  # GET /episode_comments
  # GET /episode_comments.json
  def index
    @episode_comments = EpisodeComment.all
  end

  # GET /episode_comments/1
  # GET /episode_comments/1.json
  def show
  end

  # GET /episode_comments/new
  def new
    @episode_comment = EpisodeComment.new
  end

  # GET /episode_comments/1/edit
  def edit
  end

  # POST /episode_comments
  # POST /episode_comments.json
  def create
    @episode_comment = EpisodeComment.new(episode_comment_params)
    for i in episode_comment_params
      puts i
    end

    respond_to do |format|
      @episodes = Episode.all
      if @episode_comment.save
        #format.html { redirect_to @episode_comment, notice: 'Episode comment was successfully created.' }
        format.html { redirect_to tv_show_path(@episodes.find(@episode_comment.episode_id).tv_show_id), notice: 'Episode comment was successfully created.' }
        format.json { render :show, status: :created, location: @episode_comment }
      else
        format.html { render :new }
        format.json { render json: @episode_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episode_comments/1
  # PATCH/PUT /episode_comments/1.json
  def update
    @episodes = Episode.all
    respond_to do |format|
      if @episode_comment.update(episode_comment_params)
        format.html { redirect_to tv_show_path(@episodes.find(@episode_comment.episode_id).tv_show_id), notice: 'Episode comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode_comment }
      else
        format.html { render :edit }
        format.json { render json: @episode_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episode_comments/1
  # DELETE /episode_comments/1.json
  def destroy
    @episodes = Episode.all
    @episode_comment.destroy
    respond_to do |format|
      format.html { redirect_to tv_show_path(@episodes.find(@episode_comment.episode_id).tv_show_id), notice: 'Episode comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode_comment
      @episode_comment = EpisodeComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_comment_params
      params.require(:episode_comment).permit(:user_id, :episode_id, :content)
    end
end
