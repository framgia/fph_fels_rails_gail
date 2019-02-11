Rails.application.routes.draw do
	root 'static_pages#home'
 	get '/login', to: 'sessions#new'
  get '/category', to: 'categories#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users
end