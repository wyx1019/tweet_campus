class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :micropost

  has_many :comments, dependent: :destroy

  has_many :replies, dependent: :destroy

  has_many :participations, dependent: :destroy
  has_many :participated_contents, through: :participations, source: :content

  has_one_attached :user_image

    before_save { self.email = self.email.downcase }

    validates :name, presence: true, length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    validates :major, presence: true
                
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # ユーザーをフォローする
    def follow(other_user)
      following << other_user 
      #followingで取得したオブジェクトは、配列のように要素を追加したり削除したりすることができます。
      #削除の場合: user.following.delete(other_user)
    end

    # ユーザーをフォロー解除する
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # 現在のユーザーがフォローしてたらtrueを返す
    def following?(other_user)
      following.include?(other_user)
    end

    def like(other_post)
      liked_posts << other_post
    end
  
    def unlike(other_post)
      liked_posts.find_by(post_id: other_post_id).destroy
    end
  
    def like?(other_post)
      liked_posts.include? (other_post)
    end

    def participating?(other_content)
      participated_contents.include?(other_content)
    end

    def self.search_keyword(keyword,year)
      if keyword && year != '0'
        User.where('name LIKE(?) and year = ? ', "%#{keyword}%", "#{year}") 
      elsif keyword && year == '0'
        User.where('name LIKE(?)', "%#{keyword}%").order(created_at: :DESC)
      end
    end
end