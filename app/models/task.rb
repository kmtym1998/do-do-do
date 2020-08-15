class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: {maximum: 30}
  validates :user_id, presence: true
  validates :category_id, presence: true
end
