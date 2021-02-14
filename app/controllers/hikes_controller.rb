class HikesController < ApplicationController

    def new
        @hike = Hike.new
    end

    def create
        @hike = Hike.new(hike_params)

        if @hike.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def update
        @hike = Hike.find_by_id(params[:id])

        if @hike.update
            redirect_to hikes_path
        else
            
        end
    end

    def destroy

    end

    private
    def hike_params
        params.require(:hike).permit(:user_id, :mountain_id, :rating, :comment, :date_hiked, :percent_hiked, :hiked)
    end
end
