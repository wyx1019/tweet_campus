class Content < ApplicationRecord
validates :name, presence: true, length:{maximum: 10}
validates :catch, presence: true, length:{maximum: 25}
validates :detail, presence: true, length:{maximum: 300}
end
