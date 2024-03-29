Rails.application.routes.draw do
  resources :measures
  resources :quadrants
  resources :nonconformity_locals
  resources :nonconformity_levels
  resources :nonconformity_types
  resources :vehicle_parts
  resources :vehicles do
    resources :nonconformities, module: :vehicles
  end

  get 'nonconformities', to: 'vehicles/nonconformities#all_nonconformities'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/sessions' }
    end
  end

  get 'home', to: 'home#index'
  root 'home#index'

end
