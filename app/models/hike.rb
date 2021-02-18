class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :mountain

    validates

    # def total_distance_elevation(mountain)
    #     mountain.hike.total_distance = mountain.hike_distance * mountain.hike.hike_percentage
    # end
end
