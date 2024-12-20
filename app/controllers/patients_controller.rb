class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      flash[:notice] = "Patient ajouté avec succès !"
      redirect_to patients_path
    else
      flash[:alert] = "Une erreur est survenue. Veuillez vérifier les champs."
      render :new
    end
  end

  private

  def patient_params
    # Ajoute :status dans les paramètres permis
    params.require(:patient).permit(:first_name, :last_name, :date_of_birth, :status)
  end
end
