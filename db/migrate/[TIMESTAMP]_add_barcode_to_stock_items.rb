class AddBarcodeToStockItems < ActiveRecord::Migration[7.0]
  def change
    add_column :stock_items, :barcode, :string
    add_index :stock_items, :barcode, unique: true
  end
end 