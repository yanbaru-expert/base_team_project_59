class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  # 詳細情報を実装するためのアクション
  def show
    @user = User.find(params[:id])
  end

  # クリエイトアクション
  def create
    # Strong Parameter の記述
    User.create(user_params)
  end
  
  # 編集対象となるユーザーのデータを取得するための処理
  def edit
    @user = User.find(params[:id])
  end

  # データを更新するためのアクション
  def update
    user = User.find(params[:id])
    user.update(user_params)
  end
  # 削除機能　
  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :age)
  end

end
