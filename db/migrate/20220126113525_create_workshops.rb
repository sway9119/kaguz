class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :name, null: false, comment: "工房名称"
      t.timestamps
    end
  end
end
