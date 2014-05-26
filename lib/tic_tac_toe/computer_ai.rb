class ComputerAI
  CORNERS = [0, 2, 6, 8]
  X = 'x'
  O = 'o'

  def initialize(game_board, turn, check_winner)
    @game_board = game_board
    @old_board = game_board.board.dup
    @turn = turn
    @check_winner = check_winner
  end

  def human_player
    @turn == O ? X : O
  end

  def best_move
    if CORNERS.map { |ind| @game_board.board[ind] }.any? { |square| square == human_player }
      play_to_win || play_to_stop_human_win || play_center || play_side || play_corner || 0
    else
      play_to_win || play_to_stop_human_win || play_center || play_corner || play_side || 0
    end
  end

  private

  def play_to_win
    winning_move = @game_board.remaining_indices.select do |move|
      @game_board.move(move, @turn)
      win = @check_winner.new(@game_board.board, @turn).win?
      rollback_board
      win
    end
    winning_move.empty? ? nil : winning_move.first
  end

  def play_to_stop_human_win
    stop_human_move = @game_board.remaining_indices.select do |move|
      @game_board.move(move, human_player)
      win = @check_winner.new(@game_board.board, human_player).win?
      rollback_board
      win
    end
    stop_human_move.empty? ? nil : stop_human_move.first
  end

  def play_center
    move = @game_board.move(4, @turn) ? 4 : nil
    rollback_board
    move
  end

  def play_corner
    move = @game_board.move(0, @turn) || @game_board.move(2, @turn) || @game_board.move(6, @turn) || @game_board.move(8, @turn)
    rollback_board
    move
  end

  def play_side
    move = @game_board.move(1, @turn) || @game_board.move(3, @turn) || @game_board.move(5, @turn) || @game_board.move(7, @turn)
    rollback_board
    move
  end

  def rollback_board
    @game_board.board = @old_board.dup
  end
end
