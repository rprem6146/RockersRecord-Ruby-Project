json.array!(@albums) do |album|
  json.extract! album, :id, :name, :cover_art, :publisher_id, :released_on
  json.url album_url(album, format: :json)
end
