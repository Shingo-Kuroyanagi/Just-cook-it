class PostFoodComment < ApplicationRecord
  belongs_to :post_food
  belongs_to :user

  validates :comment, presence: true
  # 星数レビュー範囲指定(1~5)
  validates :rate, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
end
