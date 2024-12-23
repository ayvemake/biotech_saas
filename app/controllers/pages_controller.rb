class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  layout 'auth', only: [:home]

  def home
    redirect_to dashboard_path if user_signed_in?
    @resource = User.new
    @resource_name = :user
  end

  private

  # Ajout des helpers Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :resource_name, :resource, :devise_mapping
end
