class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :determine_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def determine_layout
    if devise_controller?
      'auth'
    else
      'application'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end 