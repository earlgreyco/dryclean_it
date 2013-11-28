ProblemPop::Application.routes.draw do

  #Static Pages
  root :to => 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
end
