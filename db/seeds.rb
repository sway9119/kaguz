# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# <家具>
# Furniture.create(name: 'テスト家具1', category_id: '1', image: '')
# Furniture.create(name: 'テスト家具2', category_id: '2', image: '')
# Furniture.create(name: 'テスト家具3', category_id: '3', image: '')
# Furniture.create(name: 'テスト家具4', category_id: '4', image: '')
# Furniture.create(name: 'テスト家具5', category_id: '5', image: '')

# # <カテゴリー>
# Category.create(name: 'チェア・椅子')
# Category.create(name: 'ソファ')
# Category.create(name: 'テーブル')
# Category.create(name: 'デスク')
# Category.create(name: 'ベッド')

# # <シーン>
# Scene.create(name: 'リビング')
# Scene.create(name: 'ダイニング')
# Scene.create(name: '寝室・ベッドルーム')
# Scene.create(name: 'キッチン')
# Scene.create(name: '玄関・エントランス')
# Scene.create(name: '子供部屋・キッズルーム')
# Scene.create(name: '書斎・ホームオフィス')
# Scene.create(name: 'ガーデン・アウトドア')
# Scene.create(name: '和室')

# <家具、シーンのidを列挙して中間テーブルに投入>
# Furniture.all.ids.sort.each do |furniture_id|
#     Scene.all.ids.sort.each do |scene_id|
#       FurnitureScene.create(furniture_id: furniture_id, scene_id: scene_id)
#     end
# end

# # <ユーザー>
# User.create(name: 'テストユーザー1', email: 'testuser1@example.com', password: '12345678')

# # <工房>
# Workshop.create(name: 'テスト工房1')
# WorkshopUser.create(workshop_id: 1, user_id: 1)

# # <お知らせ>
# Notification.create(sender_id: '2', receiver_id: '1', varity: '1', title: '今なら最大購入金額3倍分ポイント戻ってくる！', message: 'お買い物をするといまならポイントが戻ってくる。Q: 購入後に抽選結果が届きません。抽選結果はキャンペーン期間中1度目の購入後、1週間以内にお知らせいたします。2度目以降の購入後には届きません。', is_read: false)
