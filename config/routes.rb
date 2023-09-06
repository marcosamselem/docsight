Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index] do
    resources :appointments, only: [:new, :create]
  end

  # to delete
  resources :appointments, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get "/users/:id/booking_appointment", to: 'users#booking_appointment', as: 'booking_appointment'
  resources :users, only: [:show]
end
