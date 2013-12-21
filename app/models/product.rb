class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  
  
  field :name, type: String
  
  has_many :boms 
  has_many :assembly_boms
  has_many :orders
end
