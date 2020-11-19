class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # 多重度の設定
  has_many :post_foods,dependent: :destroy
  has_many :post_food_comments,dependent: :destroy
  has_many :post_food_favorites,dependent: :destroy
  
   # バリデーション設定   
  validates :name, presence:true
  validates :email, presence:true
  validates :age, presence:true
  validates :sex, presence:true
  validates :introduction,length:{maximum: 300}
  
  #enumデータ管理
  enum age: {"10代": 0,"20代": 1,"30代": 2,"40代": 3,"50代": 4,"60代以上": 5}
  enum sex: {"男性": 0,"女性": 1,"その他": 2}
  # 画像投稿機能
  attachment :image
   
  def active_for_authentication?
   super && (self.is_deleted == false)
  end
  #ログインするときに退会済のユーザーを弾く為のメソッド
 # ユーザー検索
  def self.search_for(content, method)
      User.where("name LIKE ?", "%#{content}%")
  end
end
