json.extract! artwork, :id, :name, :artist_id, :completed_at, :status, :created_at, :updated_at
json.url artwork_url(artwork, format: :json)
