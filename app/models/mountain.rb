class Mountain < ApplicationRecord
    has_many :links
    has_many :users, through: :links
    has_many :hikes
    has_many :users, through: :hikes

    validates :name, :city, :state, :base_elevation, :summit_elevation, :hike_distance, :directions_url, presence: true

    def display_rating
        display = "#{self.hikes.average(:rating)}".split(".")
        only_tenth(display)
    end

    def self.search(search)
        if search
            mountain = Mountain.find_by(name: search)
            if mountain
                self.where(name: search)
            else
                Mountain.all
            end
        else
            Mountain.all
        end
    end

end
