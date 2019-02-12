Rails.application.routes.draw do
  root 'static_pages#home'
  
  #navbar pages
 	get '/login', to: 'sessions#new'
  get '/category', to: 'categories#index'
  get '/signup', to: 'users#new'
  get '/category', to: 'categories#new'  

  post '/signup', to: 'users#create'
  post '/login',   to: 'sessions#create'
  post '/category', to: 'categories#create'

  delete '/logout',  to: 'sessions#destroy'
  
  resources :categories
  resources :users
end