class CreateStockBatches < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_batches do |t|
      t.string :number

      t.timestamps
    end
  end
end
