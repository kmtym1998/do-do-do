class User < ApplicationRecord
    has_many :categories
    has_many :tasks
    has_secure_password

    validates :name, presence: true, length: {maximum: 30}
    validates :password, presence: true, length: {maximum: 30}
end
