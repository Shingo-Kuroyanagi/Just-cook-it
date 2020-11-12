class UsersController < ApplicationController
   # ログイン中のユーザのみアクセス許可
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]
  
  def show
    @user = current_user
  end 
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "マイページを更新しました"
      redirect_to user_path(@user)
    else
      render'edit'
    end  
  end
  
  #退会アクション
  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted:true)
    # 退会後ログインするユーザーを弾く
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end  

private

  def user_params
    params.require(:user).permit(:image,:name,:sex,:age,:introduction,:is_deleted)
  end
  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
    end
  end
  
end
