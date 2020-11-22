class PostFoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show,:edit]
  
  def index
    @post_foods = PostFood.all
    
  end
  def new 
    @post_food = PostFood.new
  end
  
  def create 
    @post_food = PostFood.new(post_food_params)
    @post_food.user_id = current_user.id
    if @post_food.save
      flash[:notice] = "投稿完了しました"
      redirect_to post_foods_path
    else
      render 'new'
    end  
  end
  
  def show
    @post_food = PostFood.find(params[:id])
    @user = @post_food.user
    @post_food_comment = PostFoodComment.new
     #アソシエーション指定によりpost_food_id：params[:id]を取ってくる
     #floorメソッドで少数第一位切り捨て指定
     #@rate_avg = PostFoodComment.where(post_food_id: params[:id]).average(:rate)
    @rate_avg = @post_food.post_food_comments.average(:rate).to_f.floor(1)
  end
  
  def edit
    @post_food = PostFood.find(params[:id])
  end
  
  def update
    @post_food = PostFood.find(params[:id])
    if @post_food.update(post_food_params)
        flash[:notice] = "投稿情報を更新しました"
        redirect_to post_food_path(@post_food)
    else
        render 'edit'
    end  
  end
  
  
  def ranks
      @all_ranks =  PostFood.find(PostFoodFavorite.group(:post_food_id).order('count(post_food_id) desc').limit(10).pluck(:post_food_id))
      @all_ranks_rate = PostFood.group(:rate).order('count(rate) desc').limit(10).pluck(:rate)
  end
  
  private
  
  def post_food_params
    params.require(:post_food).permit(:name,:explanation,:image,:reference_site_url,:time,:genre,:cost)
  end
  
end
