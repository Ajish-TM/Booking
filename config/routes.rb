Rails.application.routes.draw do
  devise_for :users  # Automatically includes sign up, sign in, and sign out routes

  resources :services, only: [:index, :show]  # Routes for viewing services
  resources :bookings, only: [:index, :create]  # Routes for bookings

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'  # Admin dashboard route
    resources :services  # Admin routes for managing services
    # Add any other resources or routes for admin here
  end

  root to: "services#index"  # Root path for the application
end