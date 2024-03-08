Rails.application.routes.draw do

#=begin
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
  resources :events, :shifts, :tasks, :task_categories, :projects, :clients, :contacts

  get 'timekeeping', to: "shifts#new"
  get 'finances', to: "finances#index"

  root "projects#index"       # route for /

#=end
end
