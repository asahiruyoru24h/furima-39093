class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email, :kanji_last_name, :encrypted_password, :kanji_first_name, :kana_last_name, :kana_first_name, :birthday])
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'furima39093' && password == 'furifurifurima'
    end
  end
     









end