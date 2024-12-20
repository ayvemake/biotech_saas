class AddDetailsToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :birth_date, :date
  end
end
