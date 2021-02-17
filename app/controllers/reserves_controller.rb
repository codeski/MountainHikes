class ReservesController < ApplicationController

    before_action :set_reserve, only: :destroy
    
    def new
        @mountain = Mountain.find_by_id(params[:mountain_id])
        @reserve = Reserve.new
    end

    def create
        @mountain = Mountain.find_by_id(params[:mountain_id])

        @reserve = Reserve.new(reserve_params)
        @reserve.user_id = current_user.id
        @reserve.mountain_id = @mountain.id
        
        if @reserve.save
            redirect_to mountains_path
        end
    end

    def destroy
        @reserve.destroy
        redirect_to user_path(current_user)
    end

    private
    def reserve_params
        params.require(:reserve).permit(:user_id, :mountain_id)
    end

    def set_reserve
        @reserve = Reserve.find_by_id(params[:id])
    end
end
