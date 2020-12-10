class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_food_id
      t.timestamps
    end
  end
end
