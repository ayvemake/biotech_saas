class AddStatusToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :status, :integer
  end
end
