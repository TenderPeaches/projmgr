json.extract! payment, :id, :payment_method_id, :client_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
