Hootgo::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "dashboard", to: "campaigns#index"  
  get "order", to: "campaigns#new"
  
  resources :campaigns do
  	resources :translations
  end

  root 'home#index'

end
