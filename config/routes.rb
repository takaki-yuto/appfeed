Rails.application.routes.draw do

  root "users#index"
  namespace :users do
    get :login, to: "sessions#new", as: :login
    resource :session, only: [:create, :destroy] 
    get :sign_up, to: "accounts#new", as: :sign_up
    resource :account
    resource :password
  end

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :feedbacks, only: [:index]
    end
  end

  resources :app_posts, shallow: true do
    resources :feedbacks, only: [:create, :update, :destroy]
    # post :create, to: "feedbacks#create", defaults: { format: 'json' }
    # patch :update, to: "feedbacks#update", defaults: { format: 'json' }
  end
end
