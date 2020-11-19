class PostFoodsController < ApplicationController
  before_action :authenticate_user!
  
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
  
  private
  
  def post_food_params
    params.require(:post_food).permit(:name,:explanation,:image,:reference_site_url,:time,:genre,:cost)
  end
  
end
