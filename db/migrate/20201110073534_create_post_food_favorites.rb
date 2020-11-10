class CreatePostFoodFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :post_food_favorites do |t|

      t.timestamps
    end
  end
end
