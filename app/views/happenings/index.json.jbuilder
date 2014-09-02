json.array!(@happenings) do |happening|
  json.extract! happening, :id, :heading, :description, :date
  json.url happening_url(happening, format: :json)
end
