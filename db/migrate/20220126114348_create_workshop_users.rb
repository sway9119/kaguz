# frozen_string_literal: true

# CreateWorkshopUsers
class CreateWorkshopUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :workshop_users do |t|
      t.integer :workshop_id, null: false, comment: '工房ID'
      t.integer :user_id, null: false, comment: 'ユーザーID'
      t.timestamps
    end
  end
end
