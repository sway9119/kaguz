class AddColumnCategoryIdToFurnitures < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :category_id, :integer, comment: 'カテゴリーID'
  end
end
