class AddColumnSize < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :width, :integer, comment: '幅'
    add_column :furnitures, :height, :integer, comment: '高さ'
    add_column :furnitures, :depth, :integer, comment: '奥行き'
  end
end
