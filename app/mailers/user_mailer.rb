class UserMailer < ActionMailer::Base
  default from: 'no-reply@b2plus.tv'
  layout 'email'

  def contact_form(params)
    ['action', 'controller', 'utf8', 'authenticity_token', 'commit'].each { |param| params.delete param }
    @params = params
    mail(to: 'info@b2plus.tv', subject: 'B2Plus Contact Form')
  end
end
