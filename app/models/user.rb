class User < ApplicationRecord
    has_many :categories
    has_many :tasks

    validates :name, presence: true, length: {maximum: 30}
    validates :password, presence: true, length: {maximum: 30}
end
