class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        if !!current_user
        else
            redirect_to "/home"
        end
    end

end


# should not be able to edit another persons hike