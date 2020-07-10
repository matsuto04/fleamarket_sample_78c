class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  private

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :first_name,
      :family_name,
      :first_name_kana,
      :family_name_kana,
      :birth_day
    ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      sending_destination_attributes: [
        :destination_first_name,
        :destination_family_name,
        :destination_first_name_kana,
        :destination_family_name_kana,
        :post_code, 
        :prefecture_code_id,
        :city,
        :house_number,
        :building_name,
        :phone_number
      ] 
    ])
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
