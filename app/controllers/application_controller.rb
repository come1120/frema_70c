class ApplicationController < ActionController::Base
  # before_action :basic_auth
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # private

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == Rails.application.credentials.basic[:username] && 
  #     password == Rails.application.credentials.basic[:password]
  #   end
  # end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :tel_number])
  # end


end
