# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_31_204440) do
  create_table "client_contacts", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "client_id", null: false
    t.index ["client_id"], name: "index_client_contacts_on_client_id"
    t.index ["contact_id"], name: "index_client_contacts_on_contact_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.integer "invoice_id", null: false
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_credits_on_invoice_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.integer "statement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statement_id"], name: "index_estimates_on_statement_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "name"
    t.text "notes"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_events_on_project_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "label"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount"
    t.string "label"
    t.date "date_incurred"
    t.integer "expense_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "statement_id", null: false
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["statement_id"], name: "index_invoices_on_statement_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.float "quantity"
    t.float "subtotal"
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id", null: false
    t.float "subtotal"
    t.float "gst"
    t.float "pst"
    t.float "discount"
    t.float "total"
    t.string "notes"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["deadline"], name: "index_orders_on_deadline"
  end

  create_table "orders_statements", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "statement_id", null: false
    t.index ["order_id"], name: "index_orders_statements_on_order_id"
    t.index ["statement_id"], name: "index_orders_statements_on_statement_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "notes"
    t.integer "payment_method_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "cost"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_receipts_on_payment_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.text "notes"
    t.integer "task_id", null: false
    t.integer "order_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_shifts_on_order_item_id"
    t.index ["task_id"], name: "index_shifts_on_task_id"
  end

  create_table "statements", force: :cascade do |t|
    t.string "type"
    t.datetime "sent_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "task_category_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "type"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_contacts", "clients"
  add_foreign_key "client_contacts", "contacts"
  add_foreign_key "credits", "invoices"
  add_foreign_key "estimates", "statements"
  add_foreign_key "events", "projects"
  add_foreign_key "expenses", "expense_types"
  add_foreign_key "invoices", "statements"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "clients"
  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "projects", "clients"
  add_foreign_key "receipts", "payments"
  add_foreign_key "shifts", "order_items"
  add_foreign_key "shifts", "tasks"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "task_categories"
end
