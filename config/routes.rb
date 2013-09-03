Tabsched::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  post '/users/sign_in' => "home#index"

  resources :users
  resources :journals do
    collection do
      get :bulk_edit
      post :bulk_edit
    end
    member do
      get :taken
      get :skip
    end
  end

  resources :medications
  # resources :schedules
  get "static_pages/contact"
  get "static_pages/about"



end
