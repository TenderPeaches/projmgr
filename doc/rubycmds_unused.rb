ruby rails generate model Contact first_name:string last_name:string email:string phone:string notes:text
ruby rails generate controller ContactsController
ruby rails generate model Client contact_id:integer company_name:string
ruby rails generate controller ClientsController
ruby rails generate model Project name:string client_id:integer active:boolean
ruby rails generate controller ProjectsController
ruby rails generate model WorkType name:string
ruby rails generate controller WorkTypesController
ruby rails generate model Work project_id:integer type_id:integer minutes:integer
ruby rails generate controller WorksController
ruby rails generate model Event project_id:integer start_time:datetime end_time:datetime name:string notes:text
ruby rails generate controller EventsController

ruby rails destroy model Client
ruby rails destroy model Project
ruby rails destroy model WorkType
ruby rails destroy model Work
ruby rails destroy model Event