class ApplicationController < ActionController::Base
  # force_ssl if Rails.env.production?
  def index
  end
  def jaysonpresto
  end
  def send_message_by_visitor
    ApplicationMailer.with(email: params[:email]).submit_contact_message.deliver_now
    redirect_to root_path, notice: "Your Message Has Been Successfully Sent. It May Take 24 Hours To Make A Response To You. So Patient Is Much Appreciated. Thank You."
  end
end
