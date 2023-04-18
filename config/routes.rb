Rails.application.routes.draw do
  resources :events, :shifts, :tasks, :task_categories, :projects, :clients, :contacts
  
  root "home#index"       # route for /
end
