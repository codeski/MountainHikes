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
        total_distance_elevation(@mountain)
        
        if @hike.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        if @hike.update(hike_params)
            @hike.total_hike_elvation = @hike.summit_elevation - @hike.base_elevatoin
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
