class AddFieldsToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :barcode, :string, null: false
    add_column :products, :manufacturer, :string
    add_column :products, :reference_number, :string
    add_column :products, :category, :string
    
    add_index :products, :barcode, unique: true
  end
end 