Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  devise_for :users
  root to: "pages#home"
  resources :doctors, only: [:index] 
  get "/dashboard", to: "pages#dashboard"
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
