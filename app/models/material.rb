# frozen_string_literal: true

# class
class Material < ApplicationRecord
  has_many :furniture_materials
  has_many :furnitures, through: :furniture_materials
end
