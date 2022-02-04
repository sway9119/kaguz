class Furniture < ApplicationRecord
    belongs_to :category
    has_many :furniture_scenes
    has_many :scenes, through: :furniture_scenes
    mount_uploader :image, ImageUploader
  end
