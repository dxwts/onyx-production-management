class Bom
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :bom_id, type: String
  field :version, type: String
  field :state, type: String
  
  belongs_to :product
  has_many :bom_materiales, :dependent => :destroy
end
