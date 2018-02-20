Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'sessions/new'

  root 'static_pages#home'
  get 'static_pages/home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  resources :posts
  resources :users
  resources :comments, only: [:create, :destroy]
end
