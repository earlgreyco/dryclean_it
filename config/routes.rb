Sarmander::Application.routes.draw do

  #Static Pages
  root 'static_pages#home'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Recipes
  resources :recipes

  #Ingredients
  resources :ingredients

  #Ingredient Types
  resources :ingredient_types

  #Steps
  resources :steps

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end