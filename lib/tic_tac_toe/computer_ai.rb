class ComputerAI
  def initialize(game_board, turn, check_winner)
    @game_board = game_board
    @old_board = game_board.board.dup
    @turn = turn
    @check_winner = check_winner
  end

  def human_player
    @turn == 'o' ? 'x' : 'o'
  end

  def best_move
    computer_win || stop_human_win || play_center || play_corner || play_side
  end

  private

  def computer_win
    winning_move = @game_board.remaining_indices.select do |move| 
      @game_board.move(move, 'o')
      win = @check_winner.new(@game_board.board, @turn).win?
      return_board
      win
    end
    winning_move.empty? ? nil : winning_move
  end

  def stop_human_win
    stop_human_move = @game_board.remaining_indices.select do |move| 
      @game_board.move(move, 'x')
      win = @check_winner.new(@game_board.board, human_player).win?
      return_board
      win
    end
    stop_human_move.empty? ? nil : stop_human_move
  end

  def play_center
    move = @game_board.move(4, 'o') ? [4] : nil
    return_board
    move
  end

  def play_corner
    move = @game_board.move(0, 'o') || @game_board.move(2, 'o') || @game_board.move(6, 'o') || @game_board.move(8, 'o')
    return_board
    move
  end

  def play_side
    move = @game_board.move(1, 'o') || @game_board.move(3, 'o') || @game_board.move(5, 'o') || @game_board.move(7, 'o')
    return_board
    move
  end

  def return_board
    @game_board.board = @old_board.dup
  end
end
