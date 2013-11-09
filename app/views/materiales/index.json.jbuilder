json.array!(@materiales) do |materiale|
  json.extract! materiale, :item, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :footprint, :mark, :level, :remark, :manufacture, :quantity, :lower_limit, :role
  json.url materiale_url(materiale, format: :json)
end
