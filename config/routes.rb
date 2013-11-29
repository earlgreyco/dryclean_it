ProblemPop::Application.routes.draw do
  #Static Pages
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  #Users
  resources :users
  match '/signup', to: 'users#new', via: 'get'
end
