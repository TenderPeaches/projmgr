Rails.application.routes.draw do
  resources :events, :shifts, :tasks, :task_categories, :projects, :clients, :contacts

  get 'timekeeping', to: "shifts#new"
  
  root "projects#index"       # route for /
end
