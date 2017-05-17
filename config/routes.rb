Rails.application.routes.draw do
  get "log_games/my_history"
  get "log_games/leadboard"
  resources :log_games
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
