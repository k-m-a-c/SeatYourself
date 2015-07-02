Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resources :restaurants, only:  [:index, :show, :new, :create]
  resources :reservations, only: [:show, :new, :create, :destroy]
end