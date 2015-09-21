# File from Rails framework to configure the routes

Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/home'

end
