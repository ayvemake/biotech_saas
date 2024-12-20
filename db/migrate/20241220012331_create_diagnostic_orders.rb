class CreateDiagnosticOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :diagnostic_orders do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :doctor_name
      t.datetime :prescribed_at

      t.timestamps
    end
  end
end
