json.extract! user, :id, :first_name, :last_name, :gender, :date_of_birth, :email, :phone, :address1, :address2, :city, :state, :postal_code, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
