class Mountain < ApplicationRecord
    has_many :reserves
    has_many :users, through: :reserves
    has_many :hikes
    has_many :users, through: :hikes
end
