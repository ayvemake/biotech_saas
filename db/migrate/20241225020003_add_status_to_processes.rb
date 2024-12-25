class AddStatusToProcesses < ActiveRecord::Migration[7.1]
  def change
    # Ajout du statut aux cell_culture_processes
    unless column_exists?(:cell_culture_processes, :status)
      add_column :cell_culture_processes, :status, :integer, default: 0
    end

    # Ajout du statut aux protein_processes
    unless column_exists?(:protein_processes, :status)
      add_column :protein_processes, :status, :integer, default: 0
    end
  end
end 