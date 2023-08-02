Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'dashboard', to: 'users/registrations#dashboard', as: :user_dashboard
    resources :users do
      resources :bookings, only: [:index, :create]
      resources :reports, only: [:index] do
        collection do
          get :users_report, to: 'reports#users'
          get :bookings_report, to: 'reports#bookings'
        end
      end
    end
  end

  resources :bookings, only: [:destroy]

  root to: 'pages#home'
  get 'pricing', to: 'pages#pricing'
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'

  # Add the API endpoint route
  namespace :bookings do
    get :desks_available
  end
end
