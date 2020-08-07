class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  # has_many :commented_users, through: :comments, source: :user

  has_one_attached :image

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  def self.search_year(year)
    if year != '0'
      Micropost.where(created_at: year.in_time_zone.all_month)
    else 
      Micropost.all.order(updated_at: :DESC)
    end
  end
end
