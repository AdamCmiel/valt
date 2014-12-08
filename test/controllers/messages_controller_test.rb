require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
    setup do
        @adam = User.create name: "Adam", password: "foo"
        @steven = User.create name: "Steven", password: "bar"
        @message = {to: @steven.name, body: "Hi Steven"}
        @bad_message = {to: "Alice", body: "Hi Alice"}
    end

    test "can send a message to a user" do
        post :create, @message, {user_id: @adam.id}
        assert_equal assigns(:message).body, @message[:body]
        assert_equal assigns(:message).sender, @adam
        assert_equal assigns(:message).recipient, @steven
        assert_response :success
    end

    test "can't send a message to a non-user" do
        post :create, @bad_message, {user_id: @adam.id}
        assert_response :bad_request
    end

    test "a non-authenticated-user can't send a message" do
        post :create, @message
        assert_response :unauthorized
    end

    test "user can find his messages" do
        skip
    end
end
