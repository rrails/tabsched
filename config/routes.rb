Tabsched::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  post '/users/sign_in' => "home#index"
  get '/welcome' => "home#welcome"
  get '/journals'  => "journals#bulk_edit"
  post '/journals' => "journals#bulk_edit"
  get '/journals' => "journals#history"
  resources :users

  resources :medications
  get "static_pages/contact"
  get "static_pages/about"



end
