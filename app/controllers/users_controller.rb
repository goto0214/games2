class UsersController < ApplicationController

  def indx
    @users = User.all
    @user = current_user
    @game = Game.new
  end

  def show
    @user = User.find(params[:id])
    @game = Game.new
    @games = @user.games.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
