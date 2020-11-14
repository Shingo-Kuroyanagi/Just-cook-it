class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # 多重度の設定
  has_many :post_foods,depend,destroy

   # バリデーション設定   
  validates :name, presence:true
  validates :email, presence:true
  validates :age, presence:true
  validates :sex, presence:true
  validates :image, presence:true
  validates :introduction, presence:true,length:{minmum: 5}
  
  #enumデータ管理
  enum age: {"10代": 0,"20代": 1,"30代": 2,"40代": 3,"50代": 4,"60代以上": 5}
  enum sex: {"男性": 0,"女性": 1,"その他": 2}
  # 画像投稿機能
  attachment :image
   
  def active_for_authentication?
   super && (self.is_deleted == false)
  end
  #ログインするときに退会済のユーザーを弾く為のメソッド
end
