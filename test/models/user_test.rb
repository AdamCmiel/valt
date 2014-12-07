require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "user can verify password" do
        adam = User.create name: "Adam", password: "foo"
        assert adam.correct_password? "foo"
        assert_not adam.correct_password? "theDark L0rd has ri5en"
    end
end
