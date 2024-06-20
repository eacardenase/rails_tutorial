json.extract! profile, :id, :name, :birth, :city, :country, :gender, :role, :created_at, :updated_at
json.url profile_url(profile, format: :json)
