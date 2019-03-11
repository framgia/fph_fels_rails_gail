Rails.application.routes.draw do
  root 'static_pages#home'
  
  #navbar pages
 	get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/dashboard', to: 'static_pages#dashboard'  
  get '/settings/:id', to: 'users#edit', as: :settings

  post '/signup', to: 'users#create'
  post '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  
  namespace :admin do
    resources :categories, except: [:show] do 
      resources :words, except: [:show]
    end
  end

  resources :categories, only: [:index] do
    resources :lessons, only: [:new, :create, :show], controller: 'categories/lessons' 
  end

  resources :users, except: [:destroy,:edit] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :words, only: [:index]
  resources :activities do 
    member do
      put 'like', to: "activities#like"
      put 'unlike', to: "activities#unlike"
    end
  end
end