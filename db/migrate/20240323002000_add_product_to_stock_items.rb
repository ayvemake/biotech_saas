class AddProductToStockItems < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:stock_items, :product_id)
      add_reference :stock_items, :product, foreign_key: true
    end
  end
end 