json.extract! shipment, :id, :order_id, :customer_id, :shipment_service, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
