class AddIdtoPostFoodFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :post_food_favorites, :user_id, :integer
    add_column :post_food_favorites, :post_food_id, :integer
  end
end
