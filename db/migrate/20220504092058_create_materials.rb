class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name, null: false, comment: "素材名称"
      t.timestamps
    end
  end
end
