class GameBoard
  attr_accessor :board
  def initialize
    @board = Array.new(9, '-')
  end

  def move(location, player)
    @board[location] = player if @board[location] == '-'
  end
end
