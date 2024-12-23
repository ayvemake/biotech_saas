class AddProductToStockItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :stock_items, :product, foreign_key: true
  end
end 