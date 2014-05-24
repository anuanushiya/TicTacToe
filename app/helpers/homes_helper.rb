module HomesHelper
  def win(game)
    game.win? ? "Congratulations #{game.previous_player.upcase}! You've won!" : check_possible_moves(game)
  end

  def check_possible_moves(game)
    game.remaining_moves == 0 ? "It's a draw!" : nil
  end

  def is_disabled(box, game)
    if game.current_player == 'o'
      true
    else
      if win(game)
        true
      else
        box == '-' ? false : true
      end
    end
  end

  def tic_tac_toe_row(game, row)
    rows = { one: [*0..2], two: [*3..5], three: [*6..8] }
    game.board.each_with_index.inject("<div id='row_#{row}'>") do |acc, (box, ind)|
      disabled = game.board[ind] == '-' ? false : true
      sub_tag = button_to box, { action: 'update_game_board', id: "button_#{ind}" }, disabled: is_disabled(box, game)
      if rows[row].include?(ind)
        acc << content_tag(:div, sub_tag, class: "grid box_#{ind}")
      else
        acc << ''
      end
    end.html_safe
  end
end
