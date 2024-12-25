class RemoveBarcodeFromProducts < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:products, :barcode)
      remove_column :products, :barcode
    end
  end
end 