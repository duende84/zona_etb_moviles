require "open-uri"

class UserMailer < ApplicationMailer
  def welcome_email(user, qr_img, code)
    @user = user
    @url  = qr_img
    @code = code.code
    attachments['code.png'] = open(qr_img).read()
    mail(to: @user.email, subject: 'Bienvenid@ a la zona ETB móviles')
  end
end
