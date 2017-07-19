json.extract! artist, :id, :name, :bio, :dob, :dod, :created_at, :updated_at
json.url artist_url(artist, format: :json)
