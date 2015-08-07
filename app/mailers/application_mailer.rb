class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_DEFAUL_FROM']
  layout 'mailer'
end
