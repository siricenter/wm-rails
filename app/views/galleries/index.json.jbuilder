json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :image_id, :title, :description
  json.url gallery_url(gallery, format: :json)
end
