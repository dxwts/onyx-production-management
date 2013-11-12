json.array!(@fittings) do |fitting|
  json.extract! fitting, :box, :inside_box, :dust_proof_bag, :warranty_card, :quick_help, :help, :serial_number, :ean13_code, :remark
  json.url fitting_url(fitting, format: :json)
end
