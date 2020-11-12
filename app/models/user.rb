class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum age: {"10代": 0,"20代": 1,"30代": 2,"40代": 3,"50代": 4,"60代以上": 5}
  enum sex: {"男性": 0,"女性": 1,"その他": 2}
  # 画像投稿機能
  attachment :image
   
  def active_for_authentication?
   super && (self.is_deleted == false)
  end
  #ログインするときに退会済のユーザーを弾く為のメソッド
end
