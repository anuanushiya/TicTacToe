TicTacToe::Application.routes.draw do
  root 'homes#show'
  post 'update_game_board', to: 'homes#update_game_board', as: :update_game_board
  get 'restart_game', to: 'homes#restart_game', as: :restart_game
end
