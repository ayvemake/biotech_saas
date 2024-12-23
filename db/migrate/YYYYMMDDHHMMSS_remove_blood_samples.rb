class RemoveBloodSamples < ActiveRecord::Migration[7.1]
  def up
    drop_table :blood_samples if table_exists?(:blood_samples)
  end

  def down
    create_table :blood_samples do |t|
      t.timestamps
    end
  end
end 