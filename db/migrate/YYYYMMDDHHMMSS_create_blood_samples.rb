class CreateBloodSamples < ActiveRecord::Migration[7.1]
    def change
      create_table :blood_samples do |t|
        t.references :patient, foreign_key: true
        t.integer :status, null: false, default: 0
        
        t.timestamps
      end
  end
end
    