class PostFood < ApplicationRecord
    # 多重度の設定
  belongs_to:user
  has_many :post_food_comments,dependent: :destroy
  has_many :post_food_favorites,dependent: :destroy
  
  validates :name, presence:true
  validates :explanation, presence:true
  validates :image, presence:true
  validates :time, presence:true
  validates :genre, presence:true
  validates :cost, presence:true
  #星数レビュー範囲指定(1~5)
  validates :rate, numericality: {less_than_or_equal_to: 5,greater_than_or_equal_to: 0}, presence: true
  
  # 画像投稿機能
  attachment :image
  
  enum genre: {"朝ご飯": 0,"昼ご飯": 1,"夜ご飯": 2}
  enum cost: {"500円以下": 0,"500円": 1,"1000円": 2,"1500円":3,"2000円以上":4}
  enum time: {"5分": 0,"15分": 1,"30分": 2,"1時間":3,"１時間以上":4}
  
  
  def post_food_favorited_by?(user)
      post_food_favorites.where(user_id: user.id).exists?
  end
  
  #index表示するためにrate_avgメソッドを作成
  def rate_avg
     post_food_comments.average(:rate).to_f.floor(1)
  end  
end
