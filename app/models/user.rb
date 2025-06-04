class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    normalized_email = email.strip.downcase

    user = User.where('LOWER(email) = ?', normalized_email).first

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


end
