Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root to: 'favors#index'
  resources :favors
  resources :requested_favors, controller: 'favors', type: 'RequestedFavor'
  resources :offered_favors, controller: 'favors', type: 'OfferedFavor'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
end
