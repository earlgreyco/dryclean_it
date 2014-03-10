Sarmander::Application.routes.draw do

  #Recipes
  resources :recipes
  match '/my-recipes', to: 'recipes#my_recipes', via: 'get'

  #Recipe Images
  resources :recipe_images

  #Ingredients
  resources :ingredients

  #Steps
  resources :steps

  #Static Pages
  root 'static_pages#home'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'

  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  #Comments
  resources :comments
end