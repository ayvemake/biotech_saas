class CreateAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :analyses do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.string :category
      t.string :status
      t.text :result
      t.text :notes

      t.timestamps
    end
  end
end