class PostFoodCommentsController < ApplicationController
  
  def create
    @post_food = PostFood.find(params[:post_food_id])
    @post_food_comment = PostFoodComment.new(post_food_comment_params)
    @post_food_comment.user_id = current_user.id
    @post_food_comment.post_food_id = @post_food.id
    @user = @post_food.user
    unless @post_food_comment.save
       flash[:notice] = "投稿完了しました"
       render 'error' #app/views/book_comments/error.js.erbを参照する
      # app/views/book_comments/create.js.erbを参照する
    end
  end
  def destroy
    @post_food = PostFood.find(params[:post_food_id])
    post_food_comment = @post_food.post_food_comments.find(params[:id])
    post_food_comment.destroy
      # app/views/book_comments/destroy.js.erbを参照する
  end
  
   private
  def post_food_comment_params
    params.require(:post_food_comment).permit(:comment)
  end
  
end

