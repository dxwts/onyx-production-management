class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :name, type: String
  
  has_one :bom 
  has_one :assembly_bom
end
