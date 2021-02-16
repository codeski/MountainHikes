class HikesController < ApplicationController

    def new
        @mountain = Mountain.find_by_id(params[:mountain_id])
        @hike = Hike.new
    end

    def create
        @mountain = Mountain.find_by_id(params[:mountain_id])

        @hike = Hike.new(hike_params)
        @hike.user_id = current_user.id
        @hike.mountain_id = @mountain.id
        
        if @hike.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def update
        @hike = Hike.find_by_id(params[:id])
        
        @mountain = @hike.mountain 
        if @hike.update
            redirect_to hikes_path
        else
            render :edit
        end
    end

    def destroy
        @hike = Hike.find_by_id(params[:id])
        @hike.destroy
        redirect_to hikes_path
    end

    private
    def hike_params
        params.require(:hike).permit(:user_id, :mountain_id, :rating, :comment, :date_hiked, :percent_hiked, :hiked)
    end
end
