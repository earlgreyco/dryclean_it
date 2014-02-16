Sarmander::Application.routes.draw do

  #Static Pages
  root 'static_pages#home'
  match '/create', to: 'static_pages#create', via: 'get'
  match '/list', to: 'static_pages#list', via: 'get'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end