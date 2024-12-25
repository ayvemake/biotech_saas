class UpdateStockTables < ActiveRecord::Migration[7.1]
  def change
    # Add any missing columns to stock_categories
    unless column_exists?(:stock_categories, :description)
      add_column :stock_categories, :description, :text
    end

    # Add any missing columns to stock_items
    unless column_exists?(:stock_items, :minimum_quantity)
      add_column :stock_items, :minimum_quantity, :integer, default: 0
    end
    
    unless column_exists?(:stock_items, :unit)
      add_column :stock_items, :unit, :string
    end

    unless column_exists?(:stock_items, :reference)
      add_column :stock_items, :reference, :string
    end

    # Add any missing columns to stock_batches
    unless column_exists?(:stock_batches, :notes)
      add_column :stock_batches, :notes, :text
    end

    unless column_exists?(:stock_batches, :reference)
      add_column :stock_batches, :reference, :string
    end

    unless column_exists?(:stock_batches, :status)
      add_column :stock_batches, :status, :integer, default: 0
    end

    unless column_exists?(:stock_batches, :batch_number)
      add_column :stock_batches, :batch_number, :string
    end

    # Add any missing indexes
    unless index_exists?(:stock_categories, :name)
      add_index :stock_categories, :name, unique: true
    end

    unless index_exists?(:stock_items, :reference)
      add_index :stock_items, :reference, unique: true
    end

    unless index_exists?(:stock_batches, :reference)
      add_index :stock_batches, :reference, unique: true
    end

    unless index_exists?(:stock_batches, :batch_number)
      add_index :stock_batches, :batch_number, unique: true
    end
  end
end 