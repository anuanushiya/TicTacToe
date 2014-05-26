class HomesController < ApplicationController
  def show
  end

  def update_game_board
    GAME.move(params[:id][/\d/].to_i)
    redirect_to root_path
  end

  def restart_game
    GAME.clear
    redirect_to root_path
  end
end
