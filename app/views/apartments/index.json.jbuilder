json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :number, :bed_count, :floor, :building
  json.url apartment_url(apartment, format: :json)
end
