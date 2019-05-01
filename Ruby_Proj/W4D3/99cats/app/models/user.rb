class User < ApplicationRecord
    validates :user_name, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true


    after_initialize :ensure_session_token
    attr_reader :password


    def reset_session_token!
        self.session_token = User.generate_session_token
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bcrypt = BCrypt::Password.new(self.password_digest)
        bcrypt.is_password?(password)
    end

    def self.find_by_credentials(username, password)
       user = User.find_by(user_name: username)
       return user if user && user.is_password?(password)
       nil
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

end