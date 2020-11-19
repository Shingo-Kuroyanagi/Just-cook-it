class SearchesController < ApplicationController
 before_action :authenticate_user!
 
  def search
      # 検索対象のモデル："Customer","Product"
      @model = params["model"]
      # 検索ワード
      @content = params["content"]
      
      # @model、@contentを元に検索した結果をそれぞれのインスタンス変数に格納する
      if @model == "User"
        @users = partical_user(@content)
        @post_foods = partical_post_food(@content)
        if @users.count == 0
          flash.now[:alert] = "該当するユーザーは見つかりませんでした。"
        end
        render "users/show"
      else 
        @post_foods = partical_post_food(@content)
        if @post_foods.count == 0
          flash.now[:alert] = "該当する自炊料理情報は見つかりませんでした。"
        end
        render "post_foods/index"
      end
  end
    
  private
  # ユーザー検索
  def partical_user(content)
      User.where("name LIKE ?", "%#{content}%")
  end
  
  # 自炊料理情報検索
  def partical_post_food(content)
      PostFood.where("name LIKE ?", "%#{content}%")
  end
  
end
