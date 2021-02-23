class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :mountain

    validates :date_hiked, :percent_hiked, :rating, presence: true
    validate :date_hiked_not_in_future
    validates :percent_hiked, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 } 
    validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :comment, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" } 

    def date_hiked_not_in_future
        if date_hiked.present? && date_hiked > Date.today
            errors.add(:date_hiked, "can't be in the future")
        end
    end

    def self.order_by_date
        self.order(date_hiked: :desc)
    end

    def save_hidden_attributes
        self.total_distance = self.percent_hiked.to_f / 100 * self.mountain.hike_distance
        elevation_gain = self.mountain.summit_elevation - self.mountain.base_elevation
        self.total_elevation_gain = self.percent_hiked.to_f / 100 * elevation_gain
        self.save
    end
    

    # def total_distance_elevation(mountain)
    #     mountain.hike.total_distance = mountain.hike_distance * mountain.hike.hike_percentage
    # end

 
end
