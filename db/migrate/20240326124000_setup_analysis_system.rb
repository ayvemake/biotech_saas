class SetupAnalysisSystem < ActiveRecord::Migration[7.1]
  def change
    # Création de la table analyses
    create_table :analyses do |t|
      t.string :name, null: false
      t.references :patient, null: false, foreign_key: true
      t.references :blood_sample, null: false, foreign_key: true
      t.integer :status, default: 0
      t.datetime :started_at
      t.datetime :completed_at
      t.text :notes

      t.timestamps
    end

    # Création de la table cell_culture_processes
    unless table_exists?(:cell_culture_processes)
      create_table :cell_culture_processes do |t|
        t.references :analysis, null: false, foreign_key: true
        t.references :blood_sample, null: false, foreign_key: true
        t.date :start_date, null: false
        t.date :end_date
        t.integer :cell_count
        t.decimal :viability
        t.text :notes
        t.string :media_used
        t.integer :passage_number

        t.timestamps
      end
    end

    # Création de la table protein_processes
    unless table_exists?(:protein_processes)
      create_table :protein_processes do |t|
        t.references :analysis, null: false, foreign_key: true
        t.references :blood_sample, null: false, foreign_key: true
        t.decimal :concentration
        t.decimal :purity
        t.string :method_used
        t.text :notes
        t.datetime :processed_at

        t.timestamps
      end
    end
  end
end 