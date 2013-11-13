json.array!(@fittings) do |fitting|
  json.extract! fitting, :adapter, :adapter_sticker, :data_line, :headphone, :tf_card, :holster, :remark
  json.url fitting_url(fitting, format: :json)
end
