class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user!
  protected

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end