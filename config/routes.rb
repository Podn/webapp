Rails.application.routes.draw do
  resources :users
  root 'main#index'
  get 'main/index'
  get '/signup/information', to: 'users#information'
  get '/how-it-works', to: 'main#how_it_works'
  get '/signup', to: 'main#signup', as: :signup
  get '/login', to: 'main#login', as: :login
  post '/login', to: 'main#login_attempt', as: :login_attempt
  get '/logout', to: 'main#logout', as: :logout
end
