class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :mountain

    def total_distance_elevation(mountain)
        byebug
        mountain.hike.total_distance = mountain.hike_distance * mountain.hike.hike_percentage
    end
end
