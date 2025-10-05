class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # Devise parametre izinleri
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Devise login/logout sonrası yönlendirme
  def after_sign_in_path_for(resource)
    posts_path   # login sonrası post listesi sayfasına yönlendir
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path    # logout sonrası root sayfasına yönlendir
  end

  def after_sign_up_path_for(resource)
    posts_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username, :email, :password, :password_confirmation ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username, :email, :password, :password_confirmation, :current_password ])
  end
end
