class User < ApplicationRecord
    has_many :notifications
    has_many :workshop_users
    has_many :workshops, through: :workshop_users
    has_secure_password
end
