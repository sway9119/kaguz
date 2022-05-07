class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.string :name, null: false, comment: "色名称"
      t.timestamps
    end
  end
end
