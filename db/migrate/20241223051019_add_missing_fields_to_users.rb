class AddMissingFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:users, :first_name)
      add_column :users, :first_name, :string
    end

    unless column_exists?(:users, :last_name)
      add_column :users, :last_name, :string
    end

    unless column_exists?(:users, :role)
      add_column :users, :role, :integer, default: 0
    end

    unless column_exists?(:users, :status)
      add_column :users, :status, :integer, default: 0
    end
  end
end
