class Workshop < ApplicationRecord
    has_many :workshop_users
    has_many :users, through: :workshop_users
end
