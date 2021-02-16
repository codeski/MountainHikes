class MountainsController < ApplicationController

    def index
        @mountains = Mountain.all
    end

    def show
        @mountain = Mountain.find_by(id: params[:id])
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

    def update 
        @mountain = Mountain.find_by(id: params[:id])

        if @mountain.save
            redirect_to mountain_path(@mountain)
        else
            render :edit
        end
    end

    private
    def mountain_params
        params.require(:mountain).permit(:base_elevation, :summit_elevation, :name, :city, :state, :direction_url, :hike_distance)
    end
end
