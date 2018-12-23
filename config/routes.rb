Rails.application.routes.draw do
  resources :users
  get 'main/index'
  get '/editor', to: 'main#editor', as: :editor
  get '/signup', to: 'main#signup', as: :signup
  root 'main#index'
  get '/login', to: 'main#login', as: :login
  post '/login', to: 'main#login_attempt', as: :login_attempt
  get '/logout', to: 'main#logout', as: :logout
end
