Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pricing', to: 'pages#pricing'
end
