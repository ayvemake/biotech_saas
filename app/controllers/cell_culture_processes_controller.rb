class CellCultureProcessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cell_culture_process, only: [:show, :edit, :update, :destroy]

  def index
    @cell_culture_processes = CellCultureProcess.includes(:analysis, :blood_sample)
                                              .order(start_date: :desc)
  end

  def show
  end

  def create
    @cell_culture_process = CellCultureProcess.new(cell_culture_process_params)
    if @cell_culture_process.save
      redirect_to @cell_culture_process.analysis, notice: 'Cell culture process was successfully created.'
    else
      redirect_to @cell_culture_process.analysis, alert: 'Error creating cell culture process.'
    end
  end

  def update
    if @cell_culture_process.update(cell_culture_process_params)
      redirect_to @cell_culture_process.analysis, notice: 'Cell culture process was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_cell_culture_process
    @cell_culture_process = CellCultureProcess.find(params[:id])
  end

  def cell_culture_process_params
    params.require(:cell_culture_process).permit(
      :analysis_id, :blood_sample_id, :start_date, :end_date,
      :cell_count, :viability, :notes, :media_used, :passage_number
    )
  end
end 