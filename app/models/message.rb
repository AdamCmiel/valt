class Message < ActiveRecord::Base
    validates_presence_of :sender_id, :recipient_id, :body
    belongs_to :sender, foreign_key: :sender_id, class_name: "User"
    belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
end
