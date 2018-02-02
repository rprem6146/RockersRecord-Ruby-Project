json.array!(@publishers) do |publisher|
  json.extract! publisher, :id, :name, :address, :city, :state, :zip, :phone, :url
  json.url publisher_url(publisher, format: :json)
  json.albums(publisher.albums) do |album|
    json.name album.name
    json.album_songs(album.songs) do |song|
      json.name song.name
      json.artist song.artist.name
    end
  end

end
