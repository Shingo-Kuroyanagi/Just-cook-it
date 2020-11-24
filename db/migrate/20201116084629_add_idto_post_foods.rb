class AddIdtoPostFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :post_foods, :user_id, :integer
  end
end
