class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :name, type: String
  
  has_many :bom 
  has_many :assembly_bom
  has_many :order
end
