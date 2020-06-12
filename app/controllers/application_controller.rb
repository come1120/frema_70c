class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  EXHIBITING_STATUS = "1"
  BUYING_STATUS = "2"
  
  def check_user_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :email, :password])
  end
  
  
  private
  
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:username] && 
      password == Rails.application.credentials.basic[:password]
    end
  end
end
