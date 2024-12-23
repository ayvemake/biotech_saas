class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.integer :quantity, default: 0
      t.integer :minimum_quantity, default: 0
      t.date :expiry_date

      t.timestamps
    end
  end
end 