json.array!(@boms) do |bom|
  json.extract! bom, :bom_id, :version, :state
  json.url bom_url(bom, format: :json)
end
