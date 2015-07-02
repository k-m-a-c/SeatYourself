Rails.application.routes.draw do
  get 'restaurants/index'

  get 'restaurants/new'

  get 'restaurants/create'

  get 'restaurants/show'

  root 'users#new'
  resources :users, only: [:show, :new, :create]
  resources :restaurants, only:  [:index, :show, :new, :create]
  resources :reservations, only: [:show, :new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end