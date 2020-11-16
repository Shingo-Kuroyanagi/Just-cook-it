class AddIdtoPostFoodComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_food_comments, :user_id, :integer
    add_column :post_food_comments, :post_food_id, :integer
  end
end
