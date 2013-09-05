Tabsched::Application.routes.draw do
  devise_for :users, path_names: {register: "sign_up", sign_in: "login", sign_out: "logout" }

 devise_scope :user do

    get 'register' => 'devise/registrations#new', as: :register
    get 'login' => 'devise/sessions#new', as: :login
    get 'logout' => 'devise/sessions#destroy', as: :logout

  end
  root :to => 'home#index'

  get '/welcome' => "home#welcome"

  get '/journals'  => "journals#bulk_edit"
  post '/journals' => "journals#bulk_edit"
  put '/journals' => "journals#bulk_edit"
  get '/journals/history' => "journals#history"

  resources :medications
  resources :users

end
