class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        if !current_user.nil?
        else
          redirect_to '/'
        end
    end

end
