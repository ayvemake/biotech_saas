class RemoveBarcodeConstraintsFromProducts < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:products, :barcode)
      if index_exists?(:products, :barcode)
        remove_index :products, :barcode
      end
      change_column_null :products, :barcode, true
    end
  end
end 