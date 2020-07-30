class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def like(other_user)
    liked_users << other_user
  end

  def unlike(other_user)
    liked_users.find_by(user_id: other_user_id).destroy
  end

  def like?(other_user)
    liked_users.include? (other_user)
  end

end
