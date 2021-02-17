class Mountain < ApplicationRecord
    has_many :links
    has_many :users, through: :links
    has_many :hikes
    has_many :users, through: :hikes
end
