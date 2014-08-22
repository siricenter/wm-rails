json.array!(@amenities) do |amenity|
  json.extract! amenity, :id, :title, :img_id, :img_desc
  json.url amenity_url(amenity, format: :json)
end
