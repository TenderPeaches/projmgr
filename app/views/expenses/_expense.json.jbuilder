json.extract! expense, :id, :amount, :date_incurred, :expense_type_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
