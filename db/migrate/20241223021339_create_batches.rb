class CreateBatches < ActiveRecord::Migration[8.0]
  def change
    create_table :batches do |t|
      t.string :number

      t.timestamps
    end
  end
end
