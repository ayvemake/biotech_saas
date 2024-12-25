class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :reference
      t.text :description
      t.string :manufacturer
      t.string :category
      t.decimal :unit_price
      t.string :unit

      t.timestamps
    end
  end
end 