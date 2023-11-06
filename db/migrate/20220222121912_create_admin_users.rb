# frozen_string_literal: true

# CreateAdminUsers
class CreateAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_users do |t|
      t.string :name, null: false, comment: 'ユーザー名称'
      t.string :email, null: false, coment: 'メールアドレス'
      t.string :password_digest, null: false, coment: 'パスワード'
      t.timestamps
    end
  end
end
