class ComputerAI
  def initialize(game_board, turn)
    @game_board = game_board
    @turn = turn
  end

  def move
    @game_board.remaining_indices #.any? { |move| @game_board.dup.move(move, @turn); @game_board.win? }
  end
end
