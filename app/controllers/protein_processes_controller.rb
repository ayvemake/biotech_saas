class ProteinProcessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_protein_process, only: [:show, :edit, :update, :destroy]

  def index
    @protein_processes = ProteinProcess.includes(:analysis, :blood_sample)
                                     .order(processed_at: :desc)
  end

  def show
  end

  def create
    @protein_process = ProteinProcess.new(protein_process_params)
    if @protein_process.save
      redirect_to @protein_process.analysis, notice: 'Protein process was successfully created.'
    else
      redirect_to @protein_process.analysis, alert: 'Error creating protein process.'
    end
  end

  def update
    if @protein_process.update(protein_process_params)
      redirect_to @protein_process.analysis, notice: 'Protein process was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_protein_process
    @protein_process = ProteinProcess.find(params[:id])
  end

  def protein_process_params
    params.require(:protein_process).permit(
      :analysis_id, :blood_sample_id, :concentration,
      :purity, :method_used, :notes, :processed_at
    )
  end
end 