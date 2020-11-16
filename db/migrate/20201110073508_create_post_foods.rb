class CreatePostFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :post_foods do |t|
      t.timestamps
      t.float :rate
      t.string :name, null:false
      t.text :explanation, null:false
      t.string :image_id, null:false
      t.text :reference_site_url, null:false
      t.integer :time, null:false, default: 0
      t.integer :genre, null:false, default: 0
      t.integer :cost, null:false, default: 0
      
    end
  end
end
