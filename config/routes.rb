Rails.application.routes.draw do
  root 'restaurants#index'
  resources :users, only: [:show, :new, :create]
  resources :restaurants do
    resources :reservations, only: [:show, :create, :destroy]
    resources :cuisines, only: [:index, :show, :new, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]
end