class HikesController < ApplicationController

    before_action :set_hike, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?

    def show
        
    end
    
    def new
        if params[:mountain_id] && @mountain = Mountain.find_by_id(params[:mountain_id]) 
            @hike = @mountain.hikes.build
        else
            flash[:message] = "Wrong path"
            redirect_to root_path
        end
    end

    def create
        @mountain = Mountain.find_by_id(params[:mountain_id])
        @hike = current_user.hikes.build(hike_params)
        
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

    def redirect_if_not_owner
        if current_user != @hike.user
            redirect_to user_path(current_user), message: "Not your hike"
        end
    end

    def set_hike
        @hike = Hike.find_by_id(params[:id])
    end
end
