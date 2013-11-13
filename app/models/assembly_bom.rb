class AssemblyBom
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :order_id, type: String
  field :business_id, type: String
  field :product, type: String
  field :kind, type: String
  field :onyx_p_n, type: String
  field :p_n, type: String
  field :name, type: String
  field :quantity, type: Integer
  field :remark, type: String
  
  belongs_to :product
end
