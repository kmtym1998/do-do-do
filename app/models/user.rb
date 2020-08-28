class User < ApplicationRecord
    after_destroy :check_if_admin_exists
    after_save :check_if_admin_exists

    has_many :tasks, dependent: :destroy
    has_many :categories, dependent: :destroy
    has_secure_password

    validates :name, presence: true, length: {maximum: 30}
    validates :password, presence: true, length: {maximum: 30}

    def check_if_admin_exists
        if User.where(is_admin: true).count.zero?
            raise StandardError, "管理者を0人にすることはできません"
        end
    end
    
end
