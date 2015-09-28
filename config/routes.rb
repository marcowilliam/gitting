# File from Rails framework to configure the routes

Rails.application.routes.draw do

  resources :contacts
  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'static_pages/about', as: 'about'
  get 'static_pages/home'
  get 'contacts/new'

  get '/auth/github', as: 'github_login'
  get '/signin' => 'users#new', as: 'login'
  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"
  get '/auth/failure', :to => 'sessions#failure'

end
