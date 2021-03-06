Dryclean::Application.routes.draw do
  #Static Pages
  match '/home', to: 'static_pages#home', via: 'get'

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
  resources :customers do
    member do
      get 'load_order_history'
    end
  end

  root 'customers#index'

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
  match '/rack-it', to: 'orders#rack_it', via: 'get'
  match '/orders/:id/customer-receipt', to: 'orders#customer_receipt', via: 'get'
  match '/orders/:id/business-receipt', to: 'orders#business_receipt', via: 'get'

  #Order Items
  resources :order_items
end