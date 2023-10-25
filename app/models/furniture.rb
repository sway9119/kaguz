# frozen_string_literal: true

# 家具テーブルのモデル
class Furniture < ApplicationRecord
  belongs_to :category
  has_many :furniture_scenes
  has_many :scenes, through: :furniture_scenes
  has_many :furniture_materials
  has_many :materials, through: :furniture_materials
  has_many :furniture_colors
  has_many :colors, through: :furniture_colors
  mount_uploader :image, ImageUploader

  scope :with_category_info, lambda {
    joins(:category)
      .select('categories.id as category_id, categories.name as category_name, count(*) as category_count')
      .group(:category_id, :category_name)
  }

  scope :with_scene_info, lambda {
    joins(:scene)
      .select('scenes.id as scene_id, scenes.name as scene_name, count(*) as scene_count')
      .group(:scene_id, :scene_name)
  end
end
