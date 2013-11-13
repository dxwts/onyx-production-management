class PackagingMaterial
  include Mongoid::Document
  field :box, type: String
  field :inside_box, type: String
  field :dust_proof_bag, type: String
  field :warranty_card, type: String
  field :quick_help, type: String
  field :help, type: String
  field :serial_number, type: String
  field :ean13_code, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
