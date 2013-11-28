ProblemPop::Application.routes.draw do
	get "users/new"

  #Static Pages
  root :to => 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'

  #Users
  match '/signup', to: 'users#new', via: 'get'
end
