class Furniture < ApplicationRecord
    belongs_to :category
    has_many :furniture_scenes
    has_many :scenes, through: :furniture_scenes
    has_many :furniture_materials
    has_many :materials, through: :furniture_materials
    has_many :furniture_colors
    has_many :colors, through: :furniture_colors    
    mount_uploader :image, ImageUploader
  end
