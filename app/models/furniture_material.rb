# frozen_string_literal: true

# class
class FurnitureMaterial < ApplicationRecord
  belongs_to :furniture
  belongs_to :material
end
