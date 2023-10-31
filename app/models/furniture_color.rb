# frozen_string_literal: true

# class
class FurnitureColor < ApplicationRecord
  belongs_to :furniture
  belongs_to :color
end
