Dryclean::Application.routes.draw do
  #Static Pages
  root 'static_pages#home'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  #Articles
  resources :articles

  #Customers
  resources :customers

  #Orders
  resources :orders do
    member do
      get 'add_cash_type'
      get 'add_card_type'
      get 'add_check_type'
    end
  end

  #Order Items
  resources :order_items
end