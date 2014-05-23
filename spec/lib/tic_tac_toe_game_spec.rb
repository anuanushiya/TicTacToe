require 'tic_tac_toe/tic_tac_toe_game'
require 'tic_tac_toe/game_board'

describe TicTacToeGame do
  before do
    gameboard = GameBoard.new
    check_winner = double('check_winner')
    @game = TicTacToeGame.new(gameboard, check_winner)
  end

  describe '#board' do
    it 'returns an array of 9 dashes upon initial instantiation' do
      expect(@game.board).to eq(Array.new(9, '-'))
    end

  end
  
  describe '#move' do
    it "returns %w(x - - - - - - - -) when move(0) is called" do
      expect(@game.move(0)).to eq(%w(x - - - - - - - -))
    end

    it 'returns %w(x o - - - - - - -) when move(0) then move(1) is called' do
      @game.move(0)
      expect(@game.move(1)).to eq(%w(x o - - - - - - -))
    end

    it "returns the same board if a location has already been used" do
      @game.move(0)
      expect(@game.move(0)).to eq(%w(x - - - - - - - -))
    end
  end
end
