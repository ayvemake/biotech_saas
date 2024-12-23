class AddMissingFieldsToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :phone, :string
    add_column :patients, :address, :text
    add_column :patients, :medical_history, :text
  end
end
