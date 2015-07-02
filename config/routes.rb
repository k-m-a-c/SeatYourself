Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:show, :new, :create]
  resources :restaurants, only:  [:index, :show, :new, :create]
  resources :reservations, only: [:show, :new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end