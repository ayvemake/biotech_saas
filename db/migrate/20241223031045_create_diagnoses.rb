class CreateDiagnoses < ActiveRecord::Migration[8.0]
  def change
    create_table :diagnoses do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.text :description
      t.text :treatment
      t.text :notes

      t.timestamps
    end
  end
end
