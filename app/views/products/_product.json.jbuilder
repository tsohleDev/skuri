json.extract! product, :id, :name, :description, :price, :image, :color, :dimensions, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
