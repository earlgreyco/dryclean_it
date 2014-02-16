Sarmander::Application.routes.draw do

  #Recipes
  resources :recipes
  match '/your-recipes', to: 'recipes#your_recipes', via: 'get'

  #Ingredients
  resources :ingredients

  #Static Pages
  root 'static_pages#home'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end