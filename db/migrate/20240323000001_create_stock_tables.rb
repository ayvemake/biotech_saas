class CreateStockTables < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_categories do |t|
      t.string :name, null: false
      t.string :description
      
      t.timestamps
    end

    create_table :stock_items do |t|
      t.string :name, null: false
      t.references :stock_category, null: false, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :minimum_quantity
      t.integer :reorder_point
      
      t.timestamps
    end

    create_table :stock_batches do |t|
      t.references :stock_item, null: false, foreign_key: true
      t.string :batch_number
      t.integer :quantity
      t.date :expiry_date
      t.decimal :unit_price
      
      t.timestamps
    end
  end
end 