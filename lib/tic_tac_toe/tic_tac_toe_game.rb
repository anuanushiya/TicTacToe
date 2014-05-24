class TicTacToeGame
  attr_accessor :current_player

  def initialize(game_board = GameBoard.new, check_winner = CheckWinner, computer_ai = ComputerAI)
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
    switch_turn
    @game_board.board
  end

  def win?(player = previous_player)
    @check_winner.new(board, player).win?
  end

  def computer_move
    @computer_ai.new(@game_board, 'o', @check_winner).best_move
  end

  def previous_player
    @current_player == 'x' ? 'o' : 'x'
  end

  def remaining_moves
    @game_board.remaining_indices_count
  end

  def clear
    @game_board = GameBoard.new
    @current_player = 'x'
  end

  private

  def switch_turn
    @current_player = @current_player == 'x' ? 'o' : 'x'
  end
end
