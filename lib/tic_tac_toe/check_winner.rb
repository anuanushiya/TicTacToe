class CheckWinner
  def initialize(board, player)
    @board = board.each_slice(3).to_a
    @player = player
  end

  def win?
    horizontal_win? || vertical_win? || diagonal_win?
  end

  def horizontal_win?
    @board.any? { |row| row.all? { |val| val == @player } }
  end

  def vertical_win?
    @board.transpose.any? { |row| row.all? { |val| val == @player } }
  end

  def diagonal_win?
    @board.map.with_index.all? { |row, ind| row[ind] == @player} ||
      @board.map.with_index.all? { |row, ind| row[2 - ind] == @player}
  end
end
