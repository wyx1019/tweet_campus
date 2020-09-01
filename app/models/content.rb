class Content < ApplicationRecord

has_many :participations, dependent: :destroy
has_many :participating_users, through: :participations, source: :user
    
validates :name, presence: true, length:{maximum: 10}
validates :catch, presence: true, length:{maximum: 25}
validates :detail, presence: true, length:{maximum: 300}
end
