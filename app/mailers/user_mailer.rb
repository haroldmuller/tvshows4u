class UserMailer < ApplicationMailer
  default from: 'joaquincastillosilva@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: @user.email, subject: 'Welcome to TvShows4u')
  end

  def recommendation_email(params)
    @message = params[:body]
    @subject = params[:subject]
    @receiver = params[:to]
    @url = 'localhost:3000'
    mail(to: @receiver, subject: @subject)
  end
end
