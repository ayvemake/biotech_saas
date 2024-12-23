class Users::RegistrationsController < Devise::RegistrationsController
  layout 'auth'
  before_action :require_admin!, except: [:edit, :update]
  skip_before_action :require_no_authentication

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    
    if current_user&.admin?
      resource.save
      if resource.persisted?
        redirect_to users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    else
      redirect_to root_path, alert: 'Only administrators can create new accounts.'
    end
  end

  protected

  def require_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied. Only administrators can perform this action.'
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # Empêche la redirection automatique après la création d'un compte
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", force: true)
    self.resource = send(:"current_#{resource_name}")
  end
end 