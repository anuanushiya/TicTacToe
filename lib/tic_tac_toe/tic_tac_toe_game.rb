class TicTacToeGame

  def initialize(game_board, check_winner)
    @game_board = game_board
    @check_winner = check_winner
    @current_player = 'x'
  end

  def board
    @game_board.board
  end

  def move(location)
    @game_board.move(location, @current_player)
    switch_players
    @game_board.board
  end

  def switch_players
    @current_player = @current_player == 'x' ? 'o' : 'x'
  end
end
