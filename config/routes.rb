Rails.application.routes.draw do
  root 'static_pages#home'
  
  #navbar pages
 	get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'
  post '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  
  namespace :admin do
    resources :categories do 
      resources :words 
    end
  end

  resources :categories do
    resources :lessons, controller: 'categories/lessons' 
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,only: [:create, :destroy]
  
end