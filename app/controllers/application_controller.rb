class ApplicationController < ActionController::Base
  force_ssl if Rails.env.production?
  def index
  end
end
