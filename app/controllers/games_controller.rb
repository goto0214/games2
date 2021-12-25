class GamesController < ApplicationController
  def index
    @games = Game.all
    @game = Game.new
    @user = current_user
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @create = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      redirect_to game_path(@game)
    else
      @user = current_user
      @games = Game.all
      render :index
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.user == current_user
      render :edit
    else
      redirect_to games_path
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :genre, :detail)
  end

end
