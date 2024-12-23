class ProteinProcessesController < ApplicationController
  before_action :set_process

  def update
    if @process.update(process_params)
      redirect_to blood_sample_path(@process.blood_sample), notice: 'Protein process was successfully updated.'
    else
      redirect_to blood_sample_path(@process.blood_sample), alert: 'Failed to update protein process.'
    end
  end

  private

  def set_process
    @process = ProteinProcess.find(params[:id])
  end

  def process_params
    params.require(:protein_process).permit(:status, :notes)
  end
end 