module HomesHelper
  def win(game)
    game.win? ? "Congratulations #{game.previous_turn.upcase}! You've won!" : check_possible_moves(game)
  end

  def check_possible_moves(game)
    game.remaining_moves == 0 ? "It's a draw!" : nil
  end

  def disabled?(box, game)
    game.current_turn == 'o' || win(game) || box != '-' ? true : false
  end

  def tic_tac_toe_row(game, row)
    rows = { one: [*0..2], two: [*3..5], three: [*6..8] }
    game.board.each_with_index.inject("<div id='row_#{row}'>") do |acc, (box, ind)|
      sub_tag = button_to box, { action: 'update_game_board', id: "button_#{ind}" }, disabled: disabled?(box, game)
      acc += rows[row].include?(ind) ? content_tag(:div, sub_tag, class: "grid box_#{ind}") : ''
    end.html_safe
  end
end
