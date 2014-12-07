require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message_text = "foobar"
  end

  test "has a sender" do
    adam = User.create! name: "Adam", password: "foo"
    steven = User.create name: "Steven", password: "bar"

    message = adam.send_message @message_text, to: steven
    assert message.valid?
    assert message.persisted?

    assert message.sender == adam, "User had no sender"
    assert message.recipient == steven, "Steven didn't get the message"

    persisted = Message.find message.id
    assert persisted.body == @message_text
  end

  def teardown
    Message.destroy_all
  end

end
