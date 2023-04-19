ruby rails generate scaffold Contact first_name:string last_name:string email:string phone:string notes:text 
ruby rails generate scaffold Client company_name:string
ruby rails generate scaffold ClientContacts contact:belongs_to client:belongs_to
ruby rails generate scaffold Project name:string active:boolean client:belongs_to
ruby rails generate scaffold TaskCategory name:string
ruby rails generate scaffold Task task_category:belongs_to project:belongs_to
ruby rails generate scaffold Shift minutes:integer notes:text task:belongs_to
ruby rails generate scaffold Event start_time:datetime end_time:datetime name:string notes:text project:belongs_to

ruby rails db:migrate RAILS_ENV=development