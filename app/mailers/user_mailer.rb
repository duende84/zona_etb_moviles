require "open-uri"

class UserMailer < ApplicationMailer
  def welcome_email(user, qr_img)
    @user = user
    @url  = qr_img
    attachments['code.png'] = open(qr_img).read()
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
