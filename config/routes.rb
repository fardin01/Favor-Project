Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root to: 'favors#index'
  resources :favors, except: [:new]
  resources :requested_favors, controller: 'favors', type: 'RequestedFavor', except: :new
  get 'request-a-favor', to: 'favors#new', type: 'RequestedFavor'
  resources :offered_favors, controller: 'favors', type: 'OfferedFavor', except: :new
  get 'offer-a-favor', to: 'favors#new', type: 'OfferedFavor'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :acceptances, only: [:create, :update]
  resources :activities, only: :index
  resources :rewards, only: :show
  resources :searches
end
