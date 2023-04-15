ruby rails generate scaffold Contact first_name:string last_name:string email:string phone:string notes:text
ruby rails generate scaffold Client contact_id:integer company_name:string
ruby rails generate scaffold Project name:string client_id:integer active:boolean
ruby rails generate scaffold TaskCategory name:string
ruby rails generate scaffold Task project_id:integer task_category_id
ruby rails generate scaffold Shift task_id:integer minutes:integer notes:text
ruby rails generate scaffold Event project_id:integer start_time:datetime end_time:datetime name:string notes:text task_id:integer

ruby rails db:migrate RAILS_ENV=development