class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.date :birth_date
      t.string :gender
      t.text :medical_history
      t.string :patient_number, null: false
      t.text :notes

      t.timestamps
    end

    add_index :patients, :patient_number, unique: true
    add_index :patients, [:last_name, :first_name]
  end
end 