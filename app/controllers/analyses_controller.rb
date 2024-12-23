class AnalysesController < ApplicationController
  before_action :set_patient
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  def index
    @analyses = @patient.analyses.order(date: :desc)
  end

  def show
  end

  def new
    @analysis = @patient.analyses.build
  end

  def create
    @analysis = @patient.analyses.build(analysis_params)
    if @analysis.save
      redirect_to patient_path(@patient, anchor: 'analyses'), notice: 'Analysis was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @analysis.update(analysis_params)
      redirect_to patient_path(@patient, anchor: 'analyses'), notice: 'Analysis was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @analysis.destroy
    redirect_to patient_path(@patient, anchor: 'analyses'), notice: 'Analysis was successfully deleted.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_analysis
    @analysis = @patient.analyses.find(params[:id])
  end

  def analysis_params
    params.require(:analysis).permit(:date, :category, :status, :result, :notes)
  end
end 