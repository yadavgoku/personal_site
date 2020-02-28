Rails.application.routes.draw do

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources :microposts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#cover_page'
  get '/cover'          => 'users#index'
  get '/signup', to: "users#new"
  post '/signup' , to: "users#create"

  # login & logout
  resources :sessions, only: [:new, :create, :destroy]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


end
