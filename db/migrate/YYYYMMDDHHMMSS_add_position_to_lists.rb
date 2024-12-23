class AddPositionToLists < ActiveRecord::Migration[7.0]
  def up
    add_column :lists, :position, :integer
    
    # Initialiser la position pour les listes existantes
    List.order(:created_at).each.with_index(1) do |list, index|
      list.update_column :position, index
    end
  end

  def down
    remove_column :lists, :position
  end
end 