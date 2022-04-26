class Workshop < ApplicationRecord
    GOOGLE_API_KEY = ENV["GOOGLE_API_KEY"]

    has_many :workshop_users
    has_many :users, through: :workshop_users
end
