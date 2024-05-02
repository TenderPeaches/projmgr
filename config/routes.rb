Rails.application.routes.draw do

  resources :projects
  resources :invoices
  resources :estimates
  resources :credits
  resources :receipts
  resources :payments
  resources :payment_methods
  resources :transactions
  resources :orders
  resources :products
  resources :statements
  resources :expenses
  resources :expense_types
  resources :events, :shifts, :tasks, :task_categories, :clients, :contacts

  root "projects#index"       # route for /
end
