json.array!(@study_reservations) do |study_reservation|
  json.extract! study_reservation, :id, :study_room_id, :start, :stop, :date, :name
  json.url study_reservation_url(study_reservation, format: :json)
end
