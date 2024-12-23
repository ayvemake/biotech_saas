class DropExistingStockTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :stock_batches, if_exists: true
    drop_table :stock_items, if_exists: true
    drop_table :stock_categories, if_exists: true
  end
end 