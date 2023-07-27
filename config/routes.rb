Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'dashboard', to: 'users/registrations#dashboard', as: :user_dashboard
    resources :users do
      resources :bookings, only: [:create, :destroy]
    end
  end

  root to: 'pages#home'
  get 'pricing', to: 'pages#pricing'
  resources :contacts, only: [ :new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'
end
