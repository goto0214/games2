class PostCommentsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.game_id = game.id
    comment.save
    redirect_to game_path(game)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to game_path(params[:game_id])
  end

  private
    def post_comment_params
      params.require(:post_comment).permit(:comment)
    end

end
