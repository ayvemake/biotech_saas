class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :determine_layout

  private

  def determine_layout
    if devise_controller?
      'auth'
    else
      'application'
    end
  end
end 