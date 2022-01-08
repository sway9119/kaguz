class AddColumnImageToFurnitures < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :image, :string, comment: "画像"
  end
end
