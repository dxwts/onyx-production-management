json.array!(@materiales_events) do |materiales_event|
  json.extract! materiales_event, :user, :obj, :event, :quantity, :remark
  json.url materiales_event_url(materiales_event, format: :json)
end
