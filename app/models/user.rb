class User < ApplicationRecord
    has_many :tasks, dependent: :destroy
    has_many :categories, dependent: :destroy
    has_secure_password

    validates :name, presence: true, length: {maximum: 30}
    validates :password, presence: true, length: {maximum: 30}
end
