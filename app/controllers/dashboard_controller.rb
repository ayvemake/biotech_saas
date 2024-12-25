class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @recent_patients = Patient.order(created_at: :desc).limit(5)
    @recent_samples = BloodSample.order(created_at: :desc).limit(5)
  end
end 