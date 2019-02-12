Rails.application.routes.draw do
  root 'static_pages#home'
  
  #navbar pages
 	get '/login', to: 'sessions#new'
  get '/category', to: 'categories#home'
  get '/signup', to: 'users#new'
  get '/addcategory', to: 'categories#new'  

  post '/signup', to: 'users#create'
  post '/login',   to: 'sessions#create'
  post '/addcategory', to: 'categories#create'

  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
end