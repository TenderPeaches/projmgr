# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# contacts
contact__self = Contact.create(first_name: "Ysaac", last_name: "Quevillon", phone: "5142200686", email: "ocellenfadat@proton.me")
contact__ph = Contact.create(first_name: "PH", last_name: "Quevillon", phone: "", email: "phquevillon@gmail.com")
contact__guylaine = Contact.create(first_name: "Guylaine", last_name: "Germain", phone: "514337741", email: "guylainegermain-tra@gmail.com")
# clients
client__self = Client.create(company_name: "OcellEnfadat")
client__custard = Client.create(company_name: "Custard CS")
client__guylaine = Client.create(company_name: "Guylaine Germain")
# client-contacts
ClientContact.create(client: client__self, contact: contact__self)
ClientContact.create(client: client__custard, contact: contact__ph)
ClientContact.create(client: client__guylaine, contact: contact__guylaine)

# projects
project__custard_wp = Project.create(name: "Custard Wordpress", active: true, client: client__custard)
project__tra_gg = Project.create(name: "TRA - GG", active: true, client: client__guylaine)

# task categories
task_category__setup = TaskCategory.create(name: "Setup")
task_category__coordination = TaskCategory.create(name: "Coordination")
task_category__import = TaskCategory.create(name: "Import")
task_category__dev = TaskCategory.create(name: "Development")

# tasks
task__custardwp_setup = Task.create(task_category: task_category__setup, project: project__custard_wp)
task__custardwp_coordination = Task.create(task_category: task_category__coordination, project: project__custard_wp)
task__custardwp_import = Task.create(task_category: task_category__import, project: project__custard_wp)
task__custardwp_dev = Task.create(task_category: task_category__dev, project: project__custard_wp)

# orders
order__custard_wp = Order.create(client: client__custard)
order__tra_gg = Order.create(client: client__guylaine)

# products
product__regular_dev_hourly = Product.create(name: "Regular Dev (Hourly)", cost: 100, description: "Generic web development work, hourly rate")

# order items - for now, single one is fine
order_item__custard_wp = OrderItem.create(order: order__custard_wp, product: product__regular_dev_hourly)

# expense types
expense_type__publicity = ExpenseType.create(label: "Advertisement")
expense_type__bad_debts = ExpenseType.create(label: "Bad debts")
expense_type__business_taxes = ExpenseType.create(label: "Business taxes and licenses")
expense_type__delivery = ExpenseType.create(label: "Delivery, freight, messenger services")
expense_type__fuel_oil = ExpenseType.create(label: "Fuel and oil")
expense_type__insurance_premiums = ExpenseType.create(label: "Insurance premiums")
expense_type__interest = ExpenseType.create(label: "Interest")
expense_type__maintenance = ExpenseType.create(label: "Maintenance and repairs")
expense_type__management_fees = ExpenseType.create(label: "Management and administration fees")
expense_type__meals_entertainment = ExpenseType.create(label: "Meals and entertainment expenses")
expense_type__vehicle = ExpenseType.create(label: "Motor and ZE vehicle expenses")
expense_type__offce = ExpenseType.create(label: "Office expenses")
expense_type__convention = ExpenseType.create(label: "Convention fees")
expense_type__supplies = ExpenseType.create(label: "Supplies")
expense_type__legal = ExpenseType.create(label: "Legal and accounting expenses")
expense_type__property_taxes = ExpenseType.create(label: "Property taxes")
expense_type__rent = ExpenseType.create(label: "Rent")
expense_type__salaries = ExpenseType.create(label: "Salaries, wages, employer contributions, employee benefits")
expense_type__travel = ExpenseType.create(label: "Travel expenses")
expense_type__telecom = ExpenseType.create(label: "Telecommunications expenses")
expense_type__utilities = ExpenseType.create(label: "Electricity, heating, water")
expense_type__capital_cost = ExpenseType.create(label: "Capital cost allowance")
expense_type__terminal_loss = ExpenseType.create(label: "Terminal loss")
expense_type__other = ExpenseType.create(label: "Other")

# shifts
Shift.create(start_dt: DateTime.parse('2023-02-15 16:55 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-02-15 17:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Meeting w/ Parinita to discuss client needs', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-11 19:10 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-11 19:50 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Assess WordPress demo build', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-17 16:55 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-17 17:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Assess WordPress demo build, meet w/ Parinita', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-28 10:00 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-28 10:05 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Install Wordpress on server', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-30 9:10 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-30 9:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Install Wordpress on server', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-31 12:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-31 12:23 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Setup Wordpress admin account & email', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-31 12:55 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-31 13:02 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Setup Wordpress admin account & email', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-03-31 18:00 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-03-31 18:15 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Wordpress Re-install, routing', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-04 16:20 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-04 16:50 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Themes, plug-ins, staging environment', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-04 17:05 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-04 17:40 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Themes, plug-ins, staging environment', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-05 10:40 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-05 11:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Pages, header, homepage, testimonials plug-in', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-05 14:18 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-05 16:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Homepage, blog, about us, emplyers, jobseekers, contact us, footer', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-06 15:50 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-06 16:08 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-07 13:30 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-07 13:55 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Wordfence, public/private pages, fix header', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-08 9:05 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-08 10:15 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Staging environment setup, under construction page, homepage, adjust templates, security settings', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-08 12:40 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-08 13:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Staging reinstall, menu, overall check-up + todo list', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-08 14:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-08 14:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Get in touch form', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-09 13:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-09 13:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Testimonials (Jobseekers), blog sample data', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-09 14:40 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-09 15:45 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Call to actions, jobseekers page, blog', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-09 16:30 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-09 16:55 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Navigational links, CTAs', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-10 10:00 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-10 10:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-10 14:00 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-10 14:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Fix 500 error, schedule next meeting', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-14 14:17 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-14 14:48 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Remove blog, adjust header width', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-14 15:00 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-14 15:25 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita, PH', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-20 19:05 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-20 19:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Create user for Parinita, remove Jobs CTA (Employers)', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-21 11:35 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-21 12:05 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Responsive testimonials plug-in', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-04-21 12:41 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-04-21 12:58 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Jobseekers footer margin, hide privacy policy', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-26 10:52 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-26 11:17 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Domain xfer', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-26 11:23 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-26 11:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Assess content changes', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-26 12:25 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-26 12:40 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Meeting w/ Parinita for content update + coord w/ PH', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-26 18:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-26 18:42 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Copy content: homepage, employers, job seekers', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-29 12:10 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-29 13:22 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Copy content: FAQ + accordion, Contact us, Menu, Footer', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-05-31 10:50 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-05-31 11:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Final checkup: footer form button color, header icon, coord w/ Parinita', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-01 17:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-01 17:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Change user permissions for Parinita', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-02 10:29 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-02 10:34 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Call w/ Parinita next steps, redirection', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-05 11:47 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-05 12:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Redirect to custardenergy.com', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-05 15:52 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-05 15:59 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Backup, change main domain to custardenergy.com', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-05 18:42 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-05 18:53 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Redirect to custardenergy.com', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-06 16:05 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-06 16:45 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Deploy Wordpress platform to live', order_item: order_item__custard_wp)
# 16:45-17:30 xx learning bout .htaccess
Shift.create(start_dt: DateTime.parse('2023-06-06 20:30 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-06 20:42    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Backup, troubleshoot redirection & custardenergy.com', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-06 22:15 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-06 23:00    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Troubleshoot redirection & custardenerg.com, deploy WordPress site', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-07 15:40 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-07 16:15    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Deploy WordPress site, clean up directories', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-07 10:57 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-07 11:14    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Fix 403 on custardcs.com, redirect to custardenergy.com, test batch file', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-06-07 16:31 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-06-07 16:35    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Fix 403 on custardcs.com, redirect to custardenergy.com, test batch file', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-07-03 18:03 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-07-03 18:14    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Call w/ Parinita for robots.txt file modification', order_item: order_item__custard_wp)
Shift.create(start_dt: DateTime.parse('2023-07-05 17:25 -5', '%Y-%m-%d %I:%M %z'), end_dt: DateTime.parse('2023-07-05 17:35    -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Remove unused Wordpress installation', order_item: order_item__custard_wp)

