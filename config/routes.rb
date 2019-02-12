Rails.application.routes.draw do
  root 'static_pages#home'
  
  #navbar pages
 	get '/login', to: 'sessions#new'
  get '/admin/category', to: 'admin/categories#index'
  get '/signup', to: 'users#new'
  get '/admin/category', to: 'admin/categories#new'  

  post '/signup', to: 'users#create'
  post '/login',   to: 'sessions#create'
  post '/admin/category', to: 'admin/categories#create'

  delete '/logout',  to: 'sessions#destroy'
  
  namespace :admin do
    resources :categories
  end
  resources :categories
  resources :users
end