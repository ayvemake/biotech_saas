class RecreateStocksTable < ActiveRecord::Migration[7.1]
  def up
    # Drop the existing table
    drop_table :stocks if exists?(:stocks)

    # Create the new table with explicit column types
    create_table :stocks do |t|
      t.string :name, null: false, default: ""
      t.string :category, null: false, default: ""
      t.integer :quantity, null: false, default: 0
      t.integer :minimum_quantity, null: false, default: 0
      t.date :expiry_date

      t.timestamps null: false
    end

    # Add indexes
    add_index :stocks, :name
    add_index :stocks, :category
  end

  def down
    drop_table :stocks
  end
end 