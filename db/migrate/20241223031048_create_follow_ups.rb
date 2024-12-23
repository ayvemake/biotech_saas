class CreateFollowUps < ActiveRecord::Migration[8.0]
  def change
    create_table :follow_ups do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.text :notes
      t.date :next_appointment

      t.timestamps
    end
  end
end
