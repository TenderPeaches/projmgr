Rails.application.routes.draw do
  resources :events
  resources :shifts
  resources :tasks
  resources :task_categories
  resources :projects
  resources :client_contacts
  resources :clients
  resources :contacts
  resources :events, :shifts, :tasks, :task_categories, :projects, :clients, :contacts
  
  root "home#index"       # route for /
end
