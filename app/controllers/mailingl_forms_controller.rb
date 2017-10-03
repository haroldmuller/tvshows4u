class MailinglFormsController < ApplicationController
  before_action :set_mailingl_form, only: [:show, :edit, :update, :destroy]

  # GET /mailingl_forms
  # GET /mailingl_forms.json
  def index
    @mailingl_forms = MailinglForm.all
  end

  # GET /mailingl_forms/1
  # GET /mailingl_forms/1.json
  def show
    render tv_shows_path
  end

  # GET /mailingl_forms/new
  def new
    @mailingl_form = MailinglForm.new(:subject => params[:subject], :body => params[:body])
  end

  # GET /mailingl_forms/1/edit
  def edit
  end

  # POST /mailingl_forms
  # POST /mailingl_forms.json
  def create
    @mailingl_form = MailinglForm.new(mailingl_form_params)
    begin
      UserMailer.recommendation_email(mailingl_form_params).deliver

    rescue ArgumentError
    else
      redirect_to tv_shows_path, notice: 'Message has been sent.'
    end


  end

  # PATCH/PUT /mailingl_forms/1
  # PATCH/PUT /mailingl_forms/1.json
  def update


  end

  # DELETE /mailingl_forms/1
  # DELETE /mailingl_forms/1.json
  def destroy
    @mailingl_form.destroy
    respond_to do |format|
      format.html { redirect_to mailingl_forms_url, notice: 'Mailingl form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailingl_form
      @mailingl_form = MailinglForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailingl_form_params
      params.require(:mailingl_form).permit(:subject, :body, :to)
    end
end
