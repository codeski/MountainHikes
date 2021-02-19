class Mountain < ApplicationRecord
    has_many :links
    has_many :users, through: :links
    has_many :hikes
    has_many :users, through: :hikes

    validates :name, :city, :state, :base_elevation, :summit_elevation, :hike_distance, :directions_url, presence: true

    def display_rating
        # binding.pry
        display = "#{self.hikes.average(:rating)}".split(".")

        if display.count == 0
            "(no ratings yet)"
        elsif display.count > 2
            "#{display[0] + "." + display[1]}"
        else
            "#{display.join(".")}"
        end
    end

end
