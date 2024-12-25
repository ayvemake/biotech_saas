class BloodSamplesController < ApplicationController
    before_action :set_patient, only: [:index, :new, :create]
    before_action :set_blood_sample, only: [:show, :edit, :update]
  
    def index
      @blood_samples = @patient.blood_samples.includes(:cell_culture_process, :protein_process)
    end
  
    def show
    end
  
    def new
      @blood_sample = @patient.blood_samples.build
    end
  
    def create
      @blood_sample = @patient.blood_samples.build
      
      if @blood_sample.save
        @blood_sample.create_cell_culture_process
        @blood_sample.create_protein_process
        redirect_to patient_blood_samples_path(@patient), notice: 'Blood sample was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end
  
    def set_blood_sample
      @blood_sample = BloodSample.find(params[:id])
    end
  end