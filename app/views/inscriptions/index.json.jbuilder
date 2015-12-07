json.array!(@inscriptions) do |inscription|
  json.extract! inscription, :id
  json.url inscription_url(inscription, format: :json)
end
