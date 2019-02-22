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

  resources :lessons do
    resources :words ,controller: 'lessons/words'
  end

  resources :categories
  resources :users 
  
end