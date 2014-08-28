json.array!(@study_rooms) do |study_room|
  json.extract! study_room, :id, :building_id, :rm_type, :rm_number, :floor
  json.url study_room_url(study_room, format: :json)
end
