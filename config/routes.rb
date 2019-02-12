Rails.application.routes.draw do
	root 'static_pages#home'
 	get '/login', to: 'sessions#new'
  get '/category', to: 'categories#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
end