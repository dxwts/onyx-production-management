json.array!(@boms) do |bom|
  json.extract! bom, :product, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :reference, :footprint, :mark, :substitute_mark, :remark, :quantity, :version, :state
  json.url bom_url(bom, format: :json)
end