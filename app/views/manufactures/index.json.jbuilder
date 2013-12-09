json.array!(@manufactures) do |manufacture|
  json.extract! manufacture, :name, :address, :tel, :remark
  json.url manufacture_url(manufacture, format: :json)
end
