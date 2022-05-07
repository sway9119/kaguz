# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_06_081717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name", null: false, comment: "ユーザー名称"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false, comment: "カテゴリー名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name", null: false, comment: "素材名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_colors", force: :cascade do |t|
    t.integer "furniture_id", null: false, comment: "家具ID"
    t.integer "color_id", null: false, comment: "色ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_materials", force: :cascade do |t|
    t.integer "furniture_id", null: false, comment: "家具ID"
    t.integer "material_id", null: false, comment: "素材ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_scenes", force: :cascade do |t|
    t.integer "furniture_id", null: false, comment: "家具ID"
    t.integer "scene_id", null: false, comment: "シーンID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furnitures", comment: "家具テーブル", force: :cascade do |t|
    t.string "name", null: false, comment: "家具名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image", comment: "画像"
    t.integer "category_id", comment: "カテゴリーID"
    t.integer "material_id", comment: "素材ID"
    t.integer "color_id", comment: "色ID"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false, comment: "素材名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id", null: false, comment: "通知差出人ID"
    t.integer "receiver_id", null: false, comment: "通知受取人ID"
    t.integer "varity", null: false, comment: "通知種類"
    t.text "title", comment: "通知タイトル"
    t.text "message", comment: "通知内容"
    t.boolean "is_read", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.string "name", null: false, comment: "シーン名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false, comment: "ユーザー名称"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_users", force: :cascade do |t|
    t.integer "workshop_id", null: false, comment: "工房ID"
    t.integer "user_id", null: false, comment: "ユーザーID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string "name", null: false, comment: "工房名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
