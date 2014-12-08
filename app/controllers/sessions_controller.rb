class SessionsController < ApplicationController
    before_filter :authenticate_user!, only: [:show, :destroy]

    def show
        render json: {name: current_user.name}
    end

    def create
        #logging in, create a session
        user = User.find_by name: params[:name]        
        if user && user.correct_password?(params[:password])
            login user
            render json: {name: user.name}
        else
            render nothing: true, status: :unauthorized
        end
    end

    def destroy
        logout
        render nothing: true
    end
end
