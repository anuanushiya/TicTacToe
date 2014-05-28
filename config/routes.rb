TicTacToe::Application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'game#show'
  post 'update_game_board', to: 'game#update_game_board', as: :update_game_board
  get 'restart_game', to: 'game#restart_game', as: :restart_game
end
