module Forks
  def fork_sides(player)
    sides = {
      [1,3] => 0,
      [1,5] => 2,
      [7,3] => 6,
      [7,5] => 8,
    }
    sides.select do |(a, b), position|
      game_board.board[a] == player && game_board.board[b] == player
    end.values.first
  end

  def fork_corners(player)
    corners = {
      [2,6] => 3,
      [0,8] => 3
    }
    corners.select do |(a, b), position|
      game_board.board[a] == player && game_board.board[b] == player
    end.values.first
  end

  def fork_corner_side(player)
    corner_sides = {
      [0,7] => 6,
      [2,7] => 8,
      [6,1] => 0,
      [8,1] => 2,
      [2,3] => 0,
      [8,3] => 6,
      [0,5] => 2,
      [6,5] => 8
    }
    corner_sides.select do |(a, b), position|
      game_board.board[a] == player && game_board.board[b] == player
    end.values.first
  end

  def fork_position(player)
    fork_sides(player) || fork_corner_side(player) || fork_corners(player)
  end
end
