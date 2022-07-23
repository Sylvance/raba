Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Sidekiq UI
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
