class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :barcode, null: false, index: { unique: true }
      t.text :description
      t.string :manufacturer
      t.string :reference_number
      t.string :category

      t.timestamps
    end

    add_reference :stock_items, :product, foreign_key: true
  end
end 