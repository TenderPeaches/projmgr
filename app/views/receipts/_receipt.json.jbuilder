json.extract! receipt, :id, :payment_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
