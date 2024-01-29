Rails.application.routes.draw do

  resources :nonconformities
  resources :measures
  resources :quadrants
  resources :nonconformity_locals
  resources :nonconformity_levels
  resources :nonconformity_types
  resources :vehicle_parts
  resources :vehicles

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  get 'home', to: 'home#index'
  root 'home#index'

end
