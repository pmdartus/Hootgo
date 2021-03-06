Hootgo::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "dashboard", to: "campaigns#index"
  get "order", to: "campaigns#new"

  resources :pages

  resources :campaigns do
  	resources :translations do
        post "update_status", to: "translations#update_status"
    end
  end

  root 'home#index'

end
