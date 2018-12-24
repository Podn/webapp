Rails.application.routes.draw do
  resources :users
  root 'main#index'
  get 'main/index'
  get '/editor', to: 'main#editor', as: :editor
  get '/signup/information', to: 'users#information'
  get '/how-it-works', to: 'main#how_it_works'
  get '/signup', to: 'main#signup', as: :signup
  get '/editor/signup', to: 'users#editor_signup', as: :editor_signup
  get '/editor/review', to: 'users#editor_review'
  post '/editor/signup', to: 'users#create_editor', as: :create_editor
  get '/login', to: 'main#login', as: :login
  post '/login', to: 'main#login_attempt', as: :login_attempt
  get '/logout', to: 'main#logout', as: :logout
end
