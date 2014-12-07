class User < ActiveRecord::Base
    before_create :encrypt_password
    validates_presence_of :name
    validates_presence_of :password, on: :create

    attr_accessor :password
    
    has_many :messages_recieved, foreign_key: :recipient_id, class_name: "Message"
    has_many :messages_sent, foreign_key: :sender_id, class_name: "Message"

    def send_message message, options
        messages_sent.create recipient: options[:to], body: message 
    end

    def correct_password? password
        password_hash == BCrypt::Engine.hash_secret(password, password_salt)
    end

private
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
