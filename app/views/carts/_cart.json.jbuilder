json.extract! cart, :id, :product_id, :quantity, :created_at, :updated_at
json.url cart_url(cart, format: :json)
