# frozen_string_literal: true

# CreateFurnitureColors
class CreateFurnitureColors < ActiveRecord::Migration[5.2]
  def change
    create_table :furniture_colors do |t|
      t.integer :furniture_id, null: false, comment: '家具ID'
      t.integer :color_id, null: false, comment: '色ID'
      t.timestamps
    end
  end
end
