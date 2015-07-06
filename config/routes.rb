Rails.application.routes.draw do
  root 'restaurants#index'
  resources :users, only: [:show, :new, :create]
  resources :restaurants, only:  [:index, :show, :new, :create, :edit, :delete, :update] do
    resources :reservations, only: [:show, :create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
end