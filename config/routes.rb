Rails.application.routes.draw do
  # resources :comments, only: %i[ edit create update destroy ]
  resources :comments, except: %i[ index new show ]
  resources :categories
  resources :profiles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/users", to: "users#index"
  get "/signup", to: "users#new", as: "signup"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "user_edit"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy", as: "user_destroy"

  get "/confirm_email/:token", to: "users#confirm_email"

  get "/login", to: "sessions#login", as: "login"
  post "/login", to: "sessions#create", as: "new_user_session"
  delete "/logout", to: "sessions#destroy"

  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
  get "/articles/:id", to: "articles#show", as: "article"
  get "/articles/:id/edit", to: "articles#edit", as: "article_edit"
  patch "/articles/:id", to: "articles#update"
  delete "/articles/:id", to: "articles#destroy", as: "article_destroy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
end
