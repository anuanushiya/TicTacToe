require 'tic_tac_toe/game_board'

describe GameBoard do
  describe '#new' do
    it 'instantiates an array of 9 dashes' do
      expect(GameBoard.new.board).to eq(Array.new(9, '-'))
    end
  end
end
