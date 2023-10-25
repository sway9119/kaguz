# frozen_string_literal: true

# 家具とシーンのモデル
class FurnitureScene < ApplicationRecord
  belongs_to :furniture
  belongs_to :scene
end
