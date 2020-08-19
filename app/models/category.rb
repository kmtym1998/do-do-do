class Category < ApplicationRecord
  belongs_to :user
  has_many :categories

  validates :title, presence: true, length: {maximum: 30}
  validates :user_id, presence: true
end
