class User < ActiveRecord::Base
    validates_presence_of :name
    has_many :messages_recieved, foreign_key: :recipient_id, class_name: "Message"
    has_many :messages_sent, foreign_key: :sender_id, class_name: "Message"

    def send_message message, options
        messages_sent.create recipient: options[:to], body: message 
    end
end
