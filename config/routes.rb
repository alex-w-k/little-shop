Rails.application.routes.draw do
  root 'items#index'

  namespace :admin do
    get '/dashboard', to: 'dashboard#home'
  end

  
  resources :categories, only: [:index, :show] do
    resources :items, only: [:show], module: "categories"
  end

  resources :items, only: [:index, :show]
  resources :carts, only: [:create]
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'

  get '/dashboard', to: 'sessions#dashboard'
end
