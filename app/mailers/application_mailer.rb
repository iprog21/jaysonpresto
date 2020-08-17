class ApplicationMailer < ActionMailer::Base
  default from: 'iprog21@jaysonpresto.me'
  layout 'mailer'
  def submit_contact_message
    @email = params[:email]
    mail(to: Figaro.env.default_receiver_email, subject: "Test Message")
  end
end
