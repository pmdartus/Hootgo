Hootgo::Application.routes.draw do

  devise_for :users

  get '/auth/:provider/callback', to: 'authorizations#create'
  resources :authorizations

  get "dashboard", to: "campaigns#index"
  get "order", to: "campaigns#new"


  resources :campaigns do
  	resources :translations do
        post "update_status", to: "translations#update_status"
    end
  end

  root 'home#index'

end
