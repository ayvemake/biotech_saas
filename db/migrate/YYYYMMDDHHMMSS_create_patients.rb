class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :email
      t.string :phone
      t.string :address
      t.string :gender

      t.timestamps
    end
  end
end 