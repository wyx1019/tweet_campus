class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  # has_many :commented_users, through: :comments, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  def self.search_year(year)
    if year
      Micropost.where(created_at.year = year)
    end
  end
end
