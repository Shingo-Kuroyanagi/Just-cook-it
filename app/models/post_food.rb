class PostFood < ApplicationRecord
    # 多重度の設定
  belongs_to:user
  has_many :post_food_comments,depend,destroy
  has_many :post_food_favorites,depend,destroy
  
  validates :name, presence:true
  validates :explanation, presence:true
  validates :image, presence:true
  validates :time, presence:true
  validates :genre, presence:true
  validates :cost, presence:true
  
  enum genre: {"朝ご飯": 0,"昼ご飯": 1,"夜ご飯": 2}
  enum cost: {"500円以下": 0,"500円": 1,"1000円": 2,"1500円":3,"2000円以上":4}
  enum time: {"5分": 0,"15分": 1,"30分": 2,"1時間":3,"１時間以上":4}
end
