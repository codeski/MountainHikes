class LinksController < ApplicationController

    before_action :set_link, only: :destroy
    

    def create
        @link = Link.new(link_params)

        if @link.save
            redirect_to mountains_path
        end
    end

    def destroy
        @link.destroy
        redirect_to user_path(current_user)
    end

    private
    def link_params
        params.require(:link).permit(:user_id, :mountain_id)
    end

    def set_link
        @link = Link.find_by_id(params[:id])
    end
end
