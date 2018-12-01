Rails.application.routes.draw do
  get 'main/index'
  get '/signup', to: 'main#signup', as: :signup
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
