class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?
  
  private

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_day])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:destination_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:destination_family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:destination_first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:destination_family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:post_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:prefecture_code])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:house_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:building_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end
end
