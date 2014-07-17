json.array!(@contracts) do |contract|
  json.extract! contract, :id, :first_name, :last_name, :email, :home_address_1, :home_address_2, :home_city, :home_state, :home_zip, :room_type
  json.url contract_url(contract, format: :json)
end
