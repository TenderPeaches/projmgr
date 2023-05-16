json.extract! product, :id, :name, :cost, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
