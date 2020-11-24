class PostFoodFavoritesController < ApplicationController
  def create
    @post_food = PostFood.find(params[:post_food_id])
    post_food_favorite = @post_food.post_food_favorites.new(user_id: current_user.id)
    post_food_favorite.save
  end

  def destroy
    @post_food = PostFood.find(params[:post_food_id])
    post_food_favorite = @post_food.post_food_favorites.find_by(user_id: current_user.id)
    post_food_favorite.destroy
  end
end
