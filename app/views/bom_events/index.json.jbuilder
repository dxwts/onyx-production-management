json.array!(@bom_events) do |bom_event|
  json.extract! bom_event, :event
  json.url bom_event_url(bom_event, format: :json)
end
