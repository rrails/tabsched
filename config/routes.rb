Tabsched::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  post '/users/sign_in' => "home#index"

  resources :medications
  resources :schedules

  get "static_pages/contact"
  get "static_pages/about"
  get '/ice' => 'icecube#iced'

end
