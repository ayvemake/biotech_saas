class FollowUpsController < ApplicationController
  before_action :set_patient
  before_action :set_follow_up, only: [:show, :edit, :update, :destroy]

  def index
    @follow_ups = @patient.follow_ups.order(date: :desc)
  end

  def show
  end

  def new
    @follow_up = @patient.follow_ups.build
  end

  def create
    @follow_up = @patient.follow_ups.build(follow_up_params)
    if @follow_up.save
      redirect_to patient_path(@patient, anchor: 'follow-ups'), notice: 'Follow-up was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @follow_up.update(follow_up_params)
      redirect_to patient_path(@patient, anchor: 'follow-ups'), notice: 'Follow-up was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @follow_up.destroy
    redirect_to patient_path(@patient, anchor: 'follow-ups'), notice: 'Follow-up was successfully deleted.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_follow_up
    @follow_up = @patient.follow_ups.find(params[:id])
  end

  def follow_up_params
    params.require(:follow_up).permit(:date, :notes, :next_appointment)
  end
end 