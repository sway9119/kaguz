class AddColumnPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :price, :integer, comment: "価格"
  end
end
