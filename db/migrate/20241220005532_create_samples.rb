class CreateSamples < ActiveRecord::Migration[8.0]
  def change
    create_table :samples do |t|
      t.string :barcode
      t.references :patient, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
