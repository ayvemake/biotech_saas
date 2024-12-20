class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :test, null: false, foreign_key: true
      t.text :raw_data
      t.text :interpretation

      t.timestamps
    end
  end
end
