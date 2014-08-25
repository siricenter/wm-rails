json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :id, :tenant_name, :building_id, :location, :description, :tenant_phone
  json.url maintenance_url(maintenance, format: :json)
end
