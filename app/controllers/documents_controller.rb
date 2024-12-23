class DocumentsController < ApplicationController
  before_action :set_patient
  before_action :set_document, only: [:show, :destroy]

  def index
    @documents = @patient.documents.order(created_at: :desc)
  end

  def show
    redirect_to rails_blob_path(@document.file, disposition: 'attachment')
  end

  def new
    @document = @patient.documents.build
  end

  def create
    @document = @patient.documents.build(document_params)
    if @document.save
      redirect_to patient_path(@patient, anchor: 'documents'), notice: 'Document was successfully uploaded.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    redirect_to patient_path(@patient, anchor: 'documents'), notice: 'Document was successfully deleted.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_document
    @document = @patient.documents.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :category, :file)
  end
end 