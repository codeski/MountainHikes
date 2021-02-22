module HikesHelper

    def display_reviews(mountain)
        if mountain.hikes.count > 0
            render partial: "hikes/review", collection: mountain.hikes.order_by_date
        else
            "(No reviews for #{mountain.name} hike)"
        end
    end

end