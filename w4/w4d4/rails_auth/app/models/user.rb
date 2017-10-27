require 'securerandom'

class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  def self.find_by_credentials(username, pw)
    user = self.find_by(username: username)
    user.password_digest.is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end


  def password=(password)
    @password = password
    # salt = SecureRandom.base64
    self.password_digest = BCrypt::Password.create(password)
  end
end
