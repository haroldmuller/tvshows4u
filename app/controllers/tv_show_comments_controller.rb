class TvShowCommentsController < ApplicationController
  before_action :set_tv_show_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_tv_show, only: [:new, :show, :edit]

  # GET /tv_show_comments
  # GET /tv_show_comments.json
  def index
    @tv_show_comments = TvShowComment.all
  end

  # GET /tv_show_comments/1
  # GET /tv_show_comments/1.json
  def show
  end

  # GET /tv_show_comments/new
  def new
    @tv_show_comment = TvShowComment.new
  end

  # GET /tv_show_comments/1/edit
  def edit
  end

  # POST /tv_show_comments
  # POST /tv_show_comments.json
  def create
    @tv_show_comment = TvShowComment.new(tv_show_comment_params)

    respond_to do |format|
      if @tv_show_comment.save
        format.html { redirect_to tv_show_path(@tv_show_comment.tv_show_id), notice: 'Tv show comment was successfully created.' }
        format.json { render :show, status: :created, location: @tv_show_comment }
      else
        format.html { render :new }
        format.json { render json: @tv_show_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tv_show_comments/1
  # PATCH/PUT /tv_show_comments/1.json
  def update
    respond_to do |format|
      if @tv_show_comment.update(tv_show_comment_params)
        format.html { r redirect_to tv_show_path(@tv_show_comment.tv_show_id), notice: 'Tv show comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @tv_show_comment }
      else
        format.html { render :edit }
        format.json { render json: @tv_show_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tv_show_comments/1
  # DELETE /tv_show_comments/1.json
  def destroy
    @tv_show_comment.destroy
    respond_to do |format|
      format.html {  redirect_to tv_show_path(@tv_show_comment.tv_show_id), notice: 'Tv show comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_show_comment
      @tv_show_comment = TvShowComment.find(params[:id])
    end

    def set_tv_show
      @tv_show = TvShow.find(params[:tv_show_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tv_show_comment_params
      params.require(:tv_show_comment).permit(:user_id, :tv_show_id, :content)
    end
end
