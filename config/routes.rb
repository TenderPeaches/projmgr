Rails.application.routes.draw do
  resources :events
  resources :shifts
  resources :tasks
  resources :task_categories
  resources :projects
  resources :clients
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
