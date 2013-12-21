json.array!(@bom_materiales) do |bom_materiale|
  json.extract! bom_materiale, :onyx_p_n, :type, :description, :p_n, :substitute_code, :substitute_p_n, :reference, :footprint, :mark, :substitute_mark, :remark, :manufacture, :quantity, :document, :version, :state
  json.url bom_materiale_url(bom_materiale, format: :json)
end
