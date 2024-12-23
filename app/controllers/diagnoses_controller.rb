class DiagnosesController < ApplicationController
  before_action :set_patient
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy]

  def index
    @diagnoses = @patient.diagnoses
  end

  def show
  end

  def new
    @diagnosis = @patient.diagnoses.build
  end

  def create
    @diagnosis = @patient.diagnoses.build(diagnosis_params)
    if @diagnosis.save
      redirect_to patient_path(@patient), notice: 'Diagnosis was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diagnosis.update(diagnosis_params)
      redirect_to patient_path(@patient), notice: 'Diagnosis was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @diagnosis.destroy
    redirect_to patient_path(@patient), notice: 'Diagnosis was successfully deleted.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_diagnosis
    @diagnosis = @patient.diagnoses.find(params[:id])
  end

  def diagnosis_params
    params.require(:diagnosis).permit(:date, :description, :treatment, :blood_sample_id, :analysis_id)
  end
end 