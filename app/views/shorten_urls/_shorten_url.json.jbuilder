json.extract! shorten_url, :id, :original_url, :little_url, :created_at, :updated_at
json.url shorten_url_url(shorten_url, format: :json)
