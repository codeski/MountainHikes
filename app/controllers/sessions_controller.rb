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

    def destroy
        session.delete :user_id

        redirect_to '/home'
    end
    
    def omniauth
        user = User.create_from_omniauth(auth)

        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.fullmessages.join("")
            redirect_to '/signup'
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    
end
