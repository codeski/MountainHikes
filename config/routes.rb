Rails.application.routes.draw do
  
  root to: 'users#show'

  get '/signin', to: 'sessions#new'

  get '/signup', to: 'users#new'

  get "/signout", to: 'sessions#destroy'
  
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  
  resources :mountains do
    resources :hikes, shallow: true #new, index, create
    resources :links, shallow: true
  end

  get '/home', to: 'users#home'
  
  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy, :omniauth]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
