require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
    setup do
        user = {name: "Adam", password: "foo"}
        @adam = User.create! user
        post :create, user
    end

    test "create session" do
        assert_equal session[:user_id], @adam.id
    end

    test "logout" do
        delete :destroy
        assert session.empty?
    end
end
