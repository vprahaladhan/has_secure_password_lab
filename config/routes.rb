Rails.application.routes.draw do
  resources :users
  # resources :sessions
  get '/login'  => 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
