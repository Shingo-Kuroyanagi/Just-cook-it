class PostFoodCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_food = PostFood.find(params[:post_food_id])
    @post_food_comment = PostFoodComment.new(post_food_comment_params)
    @post_food_comment.user_id = current_user.id
    @post_food_comment.post_food_id = @post_food.id
    @user = @post_food.user
    unless @post_food_comment.save
      render 'error' 
      # app/views/post_food_comments/error.js.erbを参照する
      # app/views/post_food_comments/create.js.erbを参照する
    end
    @rate_avg = @post_food.rate_avg
  end

  def destroy
    @post_food = PostFood.find(params[:post_food_id])
    post_food_comment = @post_food.post_food_comments.find(params[:id])
    post_food_comment.destroy
    # app/views/book_comments/destroy.js.erbを参照する
    @rate_avg = @post_food.rate_avg
  end

  private

  def post_food_comment_params
    tmp = params.require(:post_food_comment).permit(:comment, :rate)
    # スコアデータをrateカラムに入れてやる
    tmp[:rate] = params[:score]
    tmp
  end
end
