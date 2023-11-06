# frozen_string_literal: true

# CreateFurnitureMaterials
class CreateFurnitureMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :furniture_materials do |t|
      t.integer :furniture_id, null: false, comment: '家具ID'
      t.integer :material_id, null: false, comment: '素材ID'
      t.timestamps
    end
  end
end
