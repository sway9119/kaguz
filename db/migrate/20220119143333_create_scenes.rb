class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.string :name, null: false, comment: 'シーン名称'
      t.timestamps
    end
  end
end
