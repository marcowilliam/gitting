# File from Rails framework to configure the routes

Rails.application.routes.draw do
  resources :users
  resources :contacts
  resources :disciplines do
      resources :groups, shallow: true 
  end

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  match 'inscription/new/:user_id/:discipline_id' => 'inscriptions#create', :as => :inscription_create, via: :get


  get 'static_pages/about', as: 'about'
  get 'static_pages/home'
  get 'contacts/new'

  get '/dashboard' => 'disciplines#index', as: 'dashboard'

  get '/auth/github', as: 'github_login'
  get '/signin' => 'users#new', as: 'login'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/failure', to: 'sessions#failure'
end
