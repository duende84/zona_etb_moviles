require 'rqrcode_png'

class UsersController < ApplicationController

  def create
    code = Code.where(code: user_params[:code]).first
    if code.present?
      if User.where(code_id: code.id).first.present? == false
        @user = User.new
        @user.name           = user_params[:name]
        @user.identification = user_params[:identification]
        @user.email          = user_params[:email]
        @user.phone          = user_params[:phone]
        @user.code_id        = code.id

        if @user.save
          name = "#{code.code}-#{@user.identification}"
          qr = RQRCode::QRCode.new(name, :size => 4, :level => :h )
          qr_img = qr.to_img.resize(150, 150).save("public/#{name}.png")

          cloud_img = Cloudinary::Uploader.upload(File.open(qr_img), :public_id => name)['url']

          UserMailer.welcome_email(@user, cloud_img, code).deliver_later

          msg = 'Ya estas inscrito para Zona ETB Móviles.'
        else
          msg = 'El usuario no se ha creado.'
        end
      else
        msg = 'El código ya ha sido activado.'
      end
    else
      msg = 'El código que ingresate no es válido.'
    end

    redirect_to root_path, notice: msg
  end

  private

  def user_params
    params.require(:user).permit(:name, :identification, :email, :phone, :code)
  end
end
