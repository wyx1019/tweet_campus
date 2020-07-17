class User < ApplicationRecord
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 10 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email, presence: true, length: { maximum: 100 },
                format: { with: VALID_EMAIL_REGEX }, 
                uniqueness: { case_sensitive: false }
end
