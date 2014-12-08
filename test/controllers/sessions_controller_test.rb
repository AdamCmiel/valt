require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
    test "create session" do
        user = {name: "Adam", password: "foo"}
        adam = User.create! user
        post :create, user
        assert_equal session[:user_id], adam.id
    end
end
