json.extract! user, :id, :name, :email, :phone_number, :address, :firstname, :middlename, :lastname, :bio, :metadata, :settings, :created_at, :updated_at
json.url user_url(user, format: :json)
