class Furniture < ApplicationRecord
    belongs_to :category
    has_many :furniture_scenes
    has_many :scenes, through: :furniture_scenes
    has_many :furniture_materials
    has_many :materials, through: :furniture_materials
    mount_uploader :image, ImageUploader
  end
