class CreateNewStockItems < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_items do |t|
      t.string :name
      t.string :reference
      t.references :stock_category, null: false, foreign_key: true
      t.integer :minimum_quantity, default: 0
      t.integer :current_quantity, default: 0
      t.string :unit
      t.string :location
      t.date :expiry_date

      t.timestamps
    end
    add_index :stock_items, :reference, unique: true
  end
end 