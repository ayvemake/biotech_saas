class AnalysesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  def index
    @analyses = Analysis.includes(:patient, :blood_sample)
                       .order(created_at: :desc)
  end

  def show
    @cell_culture_processes = @analysis.cell_culture_processes.order(start_date: :desc)
    @protein_processes = @analysis.protein_processes.order(processed_at: :desc)
  end

  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    if @analysis.save
      redirect_to @analysis, notice: 'Analysis was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @analysis.update(analysis_params)
      redirect_to @analysis, notice: 'Analysis was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @analysis.destroy
    redirect_to analyses_path, notice: 'Analysis was successfully deleted.'
  end

  private

  def set_analysis
    @analysis = Analysis.find(params[:id])
  end

  def analysis_params
    params.require(:analysis).permit(
      :name, :patient_id, :blood_sample_id, :status,
      :notes, :started_at, :completed_at
    )
  end
end 