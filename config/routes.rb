Hootgo::Application.routes.draw do

  # Root path
  root 'home#index'

  # User management
  devise_for :users

  # Callback oauth authentication
  get '/auth/:provider/callback', to: 'authorizations#create'
  resources :authorizations

  # Campaign management
  get "dashboard", to: "campaigns#index"
  get "order", to: "campaigns#new"

  # Post management
  resources :campaigns do
  	resources :translations do
        post "update_status", to: "translations#update_status"
    end
  end

end
