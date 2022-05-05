class AddColumnMaterialToFurnitures < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :material_id, :integer, comment: "素材ID"
  end
end
