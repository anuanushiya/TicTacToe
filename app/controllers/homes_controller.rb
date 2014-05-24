class HomesController < ApplicationController
  after_action :computer_move, only: [:update_game_board]

  def show
  end

  def computer_move
    if GAME.current_player == 'o'
      GAME.move(GAME.computer_move.first)
    end
  end

  def update_game_board
    GAME.move(params[:id][/\d/].to_i)
    redirect_to root_path and return
  end

  def restart_game
    GAME.clear
    redirect_to root_path
  end
end
