class Users::SessionsController < Devise::SessionsController
  layout 'auth'
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue
    flash.now[:alert] = "Invalid Email or password."
    render :new, status: :unprocessable_entity
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end 