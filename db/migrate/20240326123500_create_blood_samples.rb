class CreateBloodSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :blood_samples do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :reference, null: false
      t.datetime :collection_date
      t.string :collection_site
      t.integer :volume
      t.string :unit
      t.integer :status, default: 0
      t.text :notes

      t.timestamps
    end

    add_index :blood_samples, :reference, unique: true
  end
end 