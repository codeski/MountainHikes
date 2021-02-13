class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id

            redirect_to user_path(@user)
        else
            redirect_to '/signin'
        end
    end
    
    def omniauth
        byebug
    end
end
