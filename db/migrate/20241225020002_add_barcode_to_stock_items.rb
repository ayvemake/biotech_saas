class AddBarcodeToStockItems < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:stock_items, :barcode)
      add_column :stock_items, :barcode, :string
      add_index :stock_items, :barcode, unique: true
    end
  end
end 