class CreateTests < ActiveRecord::Migration[8.0]
  def change
    create_table :tests do |t|
      t.references :diagnostic_order, null: false, foreign_key: true
      t.string :name
      t.string :status
      t.datetime :performed_at

      t.timestamps
    end
  end
end
