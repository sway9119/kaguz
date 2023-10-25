class Scene < ApplicationRecord
  has_many :furniture_scenes
  has_many :furnitures, through: :furniture_scenes
end
