class PostFoodFavorite < ApplicationRecord
  belongs_to :post_food
  belongs_to :user
end
