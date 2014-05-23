TicTacToe::Application.routes.draw do
  root 'homes#show'
  get 'update_game_board', to: 'homes#update_game_board', as: :update_game_board
end
