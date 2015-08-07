class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    attachments['code.png'] = File.read("#{Code.find(@user.code_id).code}.png")
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
