Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


   
  root "welcome#index"

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login_user"
  get '/register', to: 'users#new', as: 'register_user'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :create] do
    get "/discover", to: "users#index"
    resources :movies, only: [:index,:show] do 
      resources :viewing_parties, only: [:new, :create]
    end
  end
end
