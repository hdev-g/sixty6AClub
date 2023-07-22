Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'pricing', to: 'pages#pricing'
  resources :contacts, only: [:new, :create ]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get 'contacts/sent'
end
