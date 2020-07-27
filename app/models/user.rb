class User < ApplicationRecord
  has_many :microposts
    before_save { self.email = self.email.downcase }

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/

    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    validates :major, presence: true
                
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def self.search(search)
        if search
          User.where('name LIKE(?)', "%#{search}%")
        else
          User.all.order(created_at: :DESC)
        end
      end
end