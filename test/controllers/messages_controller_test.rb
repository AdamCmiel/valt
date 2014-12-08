require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
    setup do
        @adam = User.create name: "Adam", password: "foo"
        @steven = User.create name: "Steven", password: "bar"
    end

    test "can create a message" do
        message = {to: @steven.name, body: "Hi Steven"}
        post :create, message, {user_id: @adam.id}
        assert_equal assigns(:message).body, message[:body]
        assert_equal assigns(:message).sender, @adam
        assert_equal assigns(:message).recipient, @steven
        assert_response :success
    end

    test "user can find his messages" do
        skip
    end
end
