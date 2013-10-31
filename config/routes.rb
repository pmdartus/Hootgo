Hootgo::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get "dashboard", to: "campaigns#index"  

  root 'home#index'

end
