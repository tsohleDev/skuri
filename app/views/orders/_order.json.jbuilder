json.extract! order, :id, :customer_id, :cost, :status, :address1, :address2, :city, :state, :postal_code, :created_at, :updated_at
json.url order_url(order, format: :json)
