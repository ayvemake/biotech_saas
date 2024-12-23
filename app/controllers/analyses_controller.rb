class AnalysesController < ApplicationController
  before_action :set_blood_sample, only: [:create]
  before_action :set_analysis, only: [:update]

  def create
    @analysis = @blood_sample.build_analysis
    if @analysis.save
      redirect_to blood_sample_path(@blood_sample), notice: 'Analysis was successfully created.'
    else
      redirect_to blood_sample_path(@blood_sample), alert: 'Failed to create analysis.'
    end
  end

  def update
    if @analysis.update(analysis_params)
      redirect_to blood_sample_path(@analysis.blood_sample), notice: 'Analysis was successfully updated.'
    else
      redirect_to blood_sample_path(@analysis.blood_sample), alert: 'Failed to update analysis.'
    end
  end

  def index
    @analyses = Analysis.all
  end

  private

  def set_blood_sample
    @blood_sample = BloodSample.find(params[:blood_sample_id])
  end

  def set_analysis
    @analysis = Analysis.find(params[:id])
  end

  def analysis_params
    params.require(:analysis).permit(:status, :results)
  end
end 