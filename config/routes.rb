Rails.application.routes.draw do

  resources :projects do
    resources :shifts, only: [ :index ]
  end
  resources :shifts, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :contacts, only: [ :new, :create, :show ]
  resources :clients

  root "projects#index"       # route for /
end
