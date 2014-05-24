class TicTacToeGame
  attr_accessor :current_player

  def initialize(game_board, check_winner, computer_ai)
    @game_board = game_board
    @check_winner = check_winner
    @computer_ai = computer_ai
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

  def win?(player)
    CheckWinner.new(board, player).win?
  end

  def clear
    @game_board = GameBoard.new
    @current_player= 'x'
  end

  def computer_move
    @computer_ai.new(@game_board, 'o', @check_winner).best_move
  end
end
