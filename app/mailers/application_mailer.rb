class ApplicationMailer < ActionMailer::Base
  default from: 'jezelpresto@gmail.com'
  layout 'mailer'
  def submit_contact_message
    @email = params[:email]
    mail(to: @email, subject: "Test Message")
  end
end
