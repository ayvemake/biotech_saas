class CreateNewStockBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_batches do |t|
      t.string :number
      t.references :stock_item, null: false, foreign_key: true
      t.integer :quantity
      t.date :received_date
      t.date :expiry_date

      t.timestamps
    end
    add_index :stock_batches, :number, unique: true
  end
end 