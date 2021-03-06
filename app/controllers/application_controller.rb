class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def login user
        session[:user_id] = user.id
    end

    def logout 
        session.destroy
    end

    def current_user
        User.find session[:user_id] if session[:user_id]
    end

    def authenticate_user!
        render nothing: true, status: :unauthorized unless current_user
    end
end
