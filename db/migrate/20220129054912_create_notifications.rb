# frozen_string_literal: true

# CreateNotifications
class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :sender_id, null: false, comment: '通知差出人ID'
      t.integer :receiver_id, null: false, comment: '通知受取人ID'
      t.integer :varity, null: false, comment: '通知種類'
      t.text :title, comment: '通知タイトル'
      t.text :message, comment: '通知内容'
      t.boolean :is_read, default: false, null: false
      t.timestamps
    end
  end
end
