json.array!(@contract_texts) do |contract_text|
  json.extract! contract_text, :id, :contract, :living_standards, :parking_acknowledgement, :eligibility
  json.url contract_text_url(contract_text, format: :json)
end
