class AddColumnColorToFurnitures < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :color_id, :integer, comment: "色ID"
  end
end
