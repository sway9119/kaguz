class CreateFurnitureScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :furniture_scenes do |t|
      t.integer :furniture_id, null: false, comment: '家具ID'
      t.integer :scene_id, null: false, comment: 'シーンID'
      t.timestamps
    end
  end
end
