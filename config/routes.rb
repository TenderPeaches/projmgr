Rails.application.routes.draw do
  resources :client_contacts

  resources :projects do
    resources :shifts, only: [ :index ]
  end
  resources :shifts, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :contacts, except: [ :index ]
  resources :clients

  root "projects#index"       # route for /
end
