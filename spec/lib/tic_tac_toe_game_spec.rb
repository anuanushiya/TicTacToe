require 'tic_tac_toe/tic_tac_toe_game'
require 'tic_tac_toe/game_board'
require 'tic_tac_toe/check_winner'

describe TicTacToeGame do
  before do
    gameboard = GameBoard.new
    check_winner = CheckWinner
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

  describe '#win' do
    it 'returns true when x wins' do
      game_board = double('GameBoard', board: %w(x x x o - o o - -))
      @game = TicTacToeGame.new(game_board, CheckWinner)
      expect(@game.win?).to eq(true)
    end

    it 'returns true when o wins' do
      game_board = double('GameBoard', board: %w(o x x o - o o x -))
      @game = TicTacToeGame.new(game_board, CheckWinner)
      @game.current_player = 'o'
      expect(@game.win?).to eq(true)
    end
  end

  describe '#clear' do
    it 'resets the game board and sets the current_user to x' do
      game_board = double('GameBoard', board: %w(o x x o - o o x -))
      @game = TicTacToeGame.new(game_board, CheckWinner)
      expect(@game.board).to eq(%w(o x x o - o o x -))
      @game.clear
      expect(@game.board).to eq(%w(- - - - - - - - -))
    end
  end
end
