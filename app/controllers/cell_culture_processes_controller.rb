class CellCultureProcessesController < ApplicationController
  before_action :set_process

  def update
    if @process.update(process_params)
      redirect_to blood_sample_path(@process.blood_sample), notice: 'Cell culture process was successfully updated.'
    else
      redirect_to blood_sample_path(@process.blood_sample), alert: 'Failed to update cell culture process.'
    end
  end

  private

  def set_process
    @process = CellCultureProcess.find(params[:id])
  end

  def process_params
    params.require(:cell_culture_process).permit(:status, :notes)
  end
end 