class GameBoard
  attr_accessor :board
  def initialize
    @board = Array.new(9, '-')
  end

  def move(location, player)
    if @board[location] == '-'
    @board[location] = player
    [location]
    else
      nil
    end
  end

  def remaining_indices
    @board.each_index.select { |ind| @board[ind] == '-' }
  end
end
