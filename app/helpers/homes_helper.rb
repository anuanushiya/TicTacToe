module HomesHelper
  def isdisabled(box, game)
    if game.turn == 'o'
      true                 
    else                   
      if game.win?(@game.previous_player) == true
        true
      else
        box == '-' ? false : true       
      end
    end
  end

  def tic_tac_toe_row(game, row)  
    rows = { one: [*0..2], two: [*3..5], three: [*6..8] }
    game.board.each_with_index.inject("<div id='row_#{row}'>") do |acc, (box, ind)|
      sub_tag = button_to box, { action: 'update_game_board', id: "button_#{ind}" }, disabled: false
      if rows[row].include?(ind)      
        acc << content_tag(:div, sub_tag, class: "grid box_#{ind}")
      else                 
        acc << ''          
      end                  
    end.html_safe          
  end                      
end
