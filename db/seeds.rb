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
ClientContent.create(client: client__self, contact: contact__self)
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

# shifts
a_shift = Shift.create(start: DateTime.parse('2023-02-15 16:55 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-02-15 17:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Meeting w/ Parinita to discuss client needs')
Shift.create(start: DateTime.parse('2023-03-11 19:10 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-11 19:50 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Assess WordPress demo build')
Shift.create(start: DateTime.parse('2023-03-17 16:55 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-17 17:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Assess WordPress demo build, meet w/ Parinita')
Shift.create(start: DateTime.parse('2023-03-28 10:00 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-28 10:05 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Install Wordpress on server')
Shift.create(start: DateTime.parse('2023-03-30 9:10 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-30 9:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Install Wordpress on server')
Shift.create(start: DateTime.parse('2023-03-31 12:15 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-31 12:23 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Setup Wordpress admin account & email')
Shift.create(start: DateTime.parse('2023-03-31 12:55 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-31 13:02 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Setup Wordpress admin account & email')
Shift.create(start: DateTime.parse('2023-03-31 18:00 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-03-31 18:15 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Wordpress Re-install, routing')
Shift.create(start: DateTime.parse('2023-04-04 16:20 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-04 16:50 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Themes, plug-ins, staging environment')
Shift.create(start: DateTime.parse('2023-04-04 17:05 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-04 17:40 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Themes, plug-ins, staging environment')
Shift.create(start: DateTime.parse('2023-04-05 10:40 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-05 11:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Pages, header, homepage, testimonials plug-in')
Shift.create(start: DateTime.parse('2023-04-05 14:18 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-05 16:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_import, notes: 'Homepage, blog, about us, emplyers, jobseekers, contact us, footer')
Shift.create(start: DateTime.parse('2023-04-06 15:50 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-06 16:08 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita')
Shift.create(start: DateTime.parse('2023-04-07 13:30 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-07 13:55 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_setup, notes: 'Wordfence, public/private pages, fix header')
Shift.create(start: DateTime.parse('2023-04-08 9:05 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-08 10:15 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Staging environment setup, under construction page, homepage, adjust templates, security settings')
Shift.create(start: DateTime.parse('2023-04-08 12:40 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-08 13:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Staging reinstall, menu, overall check-up + todo list')
Shift.create(start: DateTime.parse('2023-04-08 14:15 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-08 14:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Get in touch form')
Shift.create(start: DateTime.parse('2023-04-09 13:15 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-09 13:35 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Testimonials (Jobseekers), blog sample data')
Shift.create(start: DateTime.parse('2023-04-09 14:40 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-09 15:45 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Call to actions, jobseekers page, blog')
Shift.create(start: DateTime.parse('2023-04-09 16:30 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-09 16:55 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Navigational links, CTAs')
Shift.create(start: DateTime.parse('2023-04-10 10:00 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-10 10:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita')
Shift.create(start: DateTime.parse('2023-04-10 14:00 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-10 14:10 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Fix 500 error, schedule next meeting')
Shift.create(start: DateTime.parse('2023-04-14 14:17 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-14 14:48 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Remove blog, adjust header width')
Shift.create(start: DateTime.parse('2023-04-14 15:00 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-14 15:25 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_coordination, notes: 'Progress report w/ Parinita, PH')
Shift.create(start: DateTime.parse('2023-04-20 19:05 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-20 19:20 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Create user for Parinita, remove Jobs CTA (Employers)')
Shift.create(start: DateTime.parse('2023-04-21 11:35 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-21 12:05 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Responsive testimonials plug-in')
Shift.create(start: DateTime.parse('2023-04-21 12:41 -5', '%Y-%m-%d %I:%M %z'), end: DateTime.parse('2023-04-21 12:58 -5', '%Y-%m-%d %I:%M %z'), task: task__custardwp_dev, notes: 'Apply feedback: Jobseekers footer margin, hide privacy policy')