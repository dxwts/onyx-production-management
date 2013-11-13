json.array!(@packaging_materials) do |packaging_material|
  json.extract! packaging_material, :box, :inside_box, :dust_proof_bag, :warranty_card, :quick_help, :help, :serial_number, :ean13_code, :remark
  json.url packaging_material_url(packaging_material, format: :json)
end
