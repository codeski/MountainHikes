class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(email: params[:email])
        if @user.authenticate(password: params[:password])
            session[:user_id] = @user.id

            redirect_to root_path
        else
            render :new
        end
    end
    
    def omniauth
        byebug
    end
end
