Rails.application.routes.draw do

  root "users#index"
  namespace :users do
    get :login, to: "sessions#new", as: :login
    resource :session, only: [:create, :destroy] 
    get :sign_up, to: "accounts#new", as: :sign_up
    resource :account
  end

  resources :app_posts

end
