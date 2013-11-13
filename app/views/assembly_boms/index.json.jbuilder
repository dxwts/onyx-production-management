json.array!(@assembly_boms) do |assembly_bom|
  json.extract! assembly_bom, :order_id, :business_id, :product, :kind, :onyx_p_n, :p_n, :name, :quantity, :remark
  json.url assembly_bom_url(assembly_bom, format: :json)
end
