class Mountain < ApplicationRecord
    has_many :links
    has_many :users, through: :links
    has_many :hikes
    has_many :users, through: :hikes

    validates :name, :city, :state, :base_elevation, :summit_elevation, :hike_distance, :directions_url, presence: true
end
