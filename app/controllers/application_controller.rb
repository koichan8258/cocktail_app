# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:new, :create]

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'koide' && password == '8258'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
