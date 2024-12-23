class UpdatePatientsTable < ActiveRecord::Migration[8.0]
  def change
    # Renommer la colonne name en first_name
    rename_column :patients, :name, :first_name
    
    # Ajouter les nouvelles colonnes
    add_column :patients, :last_name, :string
    add_column :patients, :date_of_birth, :date
    add_column :patients, :gender, :string
    add_column :patients, :phone, :string
    add_column :patients, :address, :text
    add_column :patients, :medical_history, :text
    
    # Supprimer la colonne age car nous calculerons l'âge à partir de date_of_birth
    remove_column :patients, :age, :integer
  end
end 