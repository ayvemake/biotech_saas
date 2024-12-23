class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :email
      t.string :phone
      t.text :address
      t.text :medical_history

      t.timestamps
    end
  end
end 