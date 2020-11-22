class CreatePostFoodComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_food_comments do |t|
      t.float :rate
      t.text :comment, null:false
      
      t.timestamps
    end
  end
end
