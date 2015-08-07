require 'rqrcode_png'

class UsersController < ApplicationController

  def create
    code = Code.where(code: user_params[:code]).first
    if code.present?
      if User.where(code_id: code.id).first.present? == false
        user = User.new
        user.name           = user_params[:name]
        user.identification = user_params[:identification]
        user.email          = user_params[:email]
        user.phone          = user_params[:phone]
        user.code_id        = code.id

        if user.save

          qr = RQRCode::QRCode.new("#{code.code}-#{user.identification}", :size => 4, :level => :h )
          png = qr.to_img
          png.resize(90, 90).save("#{code.code}.png")

          UserMailer.welcome_email(user).deliver_later
          redirect_to root_path, notice: 'El usuario se ha creado con éxito.'
        else
          redirect_to root_path, notice: 'El usuario no se ha creado.'
        end
      else
        redirect_to root_path, notice: 'El código ya ha sido activado.'
      end
    else
      redirect_to root_path, notice: 'El código que ingresate no es valido.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :identification, :email, :phone, :code)
  end
end
