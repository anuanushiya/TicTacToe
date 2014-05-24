require 'tic_tac_toe/computer_ai'
require 'tic_tac_toe/game_board'

describe ComputerAI do
  describe '#move' do
    it 'plays a move that will win' do
      game_board = GameBoard.new
      game_board.board = %w(o - o - x x - - -)
      game = ComputerAI.new(game_board, 'o')
      expect(game.move).to eq(1)
    end
  end
end
