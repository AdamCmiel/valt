class MessagesController < ApplicationController
    before_filter :authenticate_user!
    before_filter :validate_recipient!, only: :create

    def create
        @message = current_user.send_message params[:body], to: @recipient
        render json: @message
    end

    def validate_recipient!
        @recipient = User.find_by name: params[:to]
        render json: {error: "The user does not exist"}, status: :bad_request unless @recipient
    end
end
