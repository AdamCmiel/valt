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

    test "view that session" do
        get :show
        assert_equal JSON.parse(@response.body)["name"], @adam.name
    end

    test "logout" do
        delete :destroy
        assert session.empty?
    end

end
