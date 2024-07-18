class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, if: -> { password.present? }
  validates :password, presence: true, length: {minimum: 6}

  def self.authenticate_with_credentials (email, password)
    stripped_email = email.strip.downcase
    user = User.find_by(email: stripped_email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
