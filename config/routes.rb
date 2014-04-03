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
      get 'save_pickup_date'
      get 'reverse_pickup'
      get 'add_cash_type'
      get 'add_card_type'
      get 'add_check_type'
      get 'use_store_credits'
      get 'load_order_price'
    end
  end
  match '/reports', to: 'orders#reports', via: 'get'
  match '/rack-it', to: 'orders#rack_it', via: 'get'

  #Order Items
  resources :order_items
end