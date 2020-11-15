class PostFoodCommentsController < ApplicationController
  
  def create
    @post_food = PostFood.find(params[:id])
    @post_food_comments = PostFoodComments.new(post_food_comments.params)
    @post_food_comments.user_id = current_user.id
    @post_food_comments.post_food_id = @post_food.id
    @user = @post_food.user
    if @post_food_comments.save
       flash[:notice] = "投稿完了しました"
       redirect_to post_food(@post_food)
    else
       render 'post_foods/show'
    end
  end
  def destroy
    @post_food = PostFood.find(params[:id])
    @post_food_comments = PostFoodComments.find(params[:id])
    @post_food_comments.destroy
    
  end
end

