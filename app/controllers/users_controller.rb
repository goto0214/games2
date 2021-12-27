class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @game = Game.new
  end

  def show
    @user = User.find(params[:id])
    @game = Game.new
    @games = @user.games.all
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users= user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
