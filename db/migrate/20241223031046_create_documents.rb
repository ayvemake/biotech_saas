class CreateDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :documents do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :title
      t.string :category
      t.string :file

      t.timestamps
    end
  end
end
