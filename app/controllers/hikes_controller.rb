class HikesController < ApplicationController

    before_action :set_hike, only: [:show, :edit, :update, :destroy]

    def show
        
    end
    
    def new
        @mountain = Mountain.find_by_id(params[:mountain_id])
        @hike = Hike.new
    end

    def create
        @mountain = Mountain.find_by_id(params[:mountain_id])

        @hike = Hike.new(hike_params)
        @hike.user_id = current_user.id
        @hike.mountain_id = @mountain.id
        @hike.total_distance = @hike.percent_hiked.to_f / 100 * @mountain.hike_distance
        elevation_gain = @mountain.summit_elevation - @mountain.base_elevation
        @hike.total_elevation_gain = @hike.percent_hiked.to_f / 100 * elevation_gain
        
        if @hike.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        @mountain = Mountain.find_by_id(@hike.mountain_id)

        if @hike.update(hike_params)
            @hike.total_distance = @hike.percent_hiked.to_f / 100 * @mountain.hike_distance
            elevation_gain = @mountain.summit_elevation - @mountain.base_elevation
            @hike.total_elevation_gain = @hike.percent_hiked.to_f / 100 * elevation_gain
            @hike.save
            
            redirect_to hike_path(@hike)
        else
            render :edit
        end
    end

    def destroy
        @hike.destroy
        redirect_to user_path(current_user)
    end

    private
    def hike_params
        params.require(:hike).permit(:user_id, :mountain_id, :rating, :comment, :date_hiked, :percent_hiked, :hiked)
    end

    def set_hike
        @hike = Hike.find_by_id(params[:id])
    end
end
