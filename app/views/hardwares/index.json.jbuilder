json.array!(@hardwares) do |hardware|
  json.extract! hardware, :cpu, :ram, :flash, :screen, :wireless, :touch_type, :battery_capacity, :connector, :remark
  json.url hardware_url(hardware, format: :json)
end
