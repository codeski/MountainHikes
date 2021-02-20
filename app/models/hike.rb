class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :mountain

    validates :date_hiked, :percent_hiked, :rating, presence: true
    validate :date_hiked_not_in_future
    validates :percent_hiked, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 } 
    validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :comment, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" } 
    validates :user_id, uniqueness: {message: "you've already reviewed this mountainadd"}

    def date_hiked_not_in_future
        if date_hiked.present? && date_hiked > Date.today
            errors.add(:date_hiked, "can't be in the future")
        end
    end

    def self.order_by_date
        self.order(date_hiked: :desc)
    end
    

    # def total_distance_elevation(mountain)
    #     mountain.hike.total_distance = mountain.hike_distance * mountain.hike.hike_percentage
    # end

 
end
