json.array!(@amenities) do |amenity|
  json.extract! amenity, :id, :image_id, :title, :description
  json.url amenity_url(amenity, format: :json)
end
