# frozen_string_literal: true

# class
class WorkshopUser < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
end
