class CreateFurnitures < ActiveRecord::Migration[5.2]
  def change
    create_table :furnitures, comment: '家具テーブル' do |t|
      t.string :name, null: false, comment: '家具名称'
      t.timestamps
    end
  end
end
