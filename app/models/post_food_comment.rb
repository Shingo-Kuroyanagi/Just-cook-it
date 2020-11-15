class PostFoodComment < ApplicationRecord
  belongs_to :post_foods
  belongs_to :user
end
