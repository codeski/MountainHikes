class MountainsController < ApplicationController

    before_action :set_mountain, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?

    def index
        @mountains = Mountain.all
    end

    def show

    end

    def new
        @mountain = Mountain.new
    end

    def create
        @mountain = Mountain.new(mountain_params)

        if @mountain.save
            redirect_to mountain_path(@mountain)
        else
            render :new
        end
    end

    def edit

    end

    def update 
        if @mountain.update(mountain_params)
            redirect_to mountain_path(@mountain)
        else
            render :edit
        end
    end

    def destroy
        @mountain.destroy
        redirect_to mountains_path
    end

    private
    def mountain_params
        params.require(:mountain).permit(:base_elevation, :summit_elevation, :name, :city, :state, :direction_url, :hike_distance)
    end

    def set_mountain
        @mountain = Mountain.find_by_id(params[:id])
    end
end
