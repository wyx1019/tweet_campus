class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  has_many :replies, dependent: :destroy

  validates :content, presence: true, length: { maximum: 250 }
end
