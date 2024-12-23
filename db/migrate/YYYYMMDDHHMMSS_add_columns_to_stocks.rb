class AddColumnsToStocks < ActiveRecord::Migration[7.1]
  def change
    add_column :stocks, :name, :string, null: false
    add_column :stocks, :quantity, :integer, default: 0
    add_column :stocks, :minimum_quantity, :integer, default: 0
    add_column :stocks, :category, :string, null: false
    add_column :stocks, :expiry_date, :date
  end
end 