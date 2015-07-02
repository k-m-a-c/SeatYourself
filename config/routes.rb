Rails.application.routes.draw do

  resrouces :users, only: [:show, :new, :create]
  resources :restaurants, only:  [:index, :show, :new, :create]
  resources :reservations, only: [:show, :new, :create, :destroy]

end