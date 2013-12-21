class BomMateriale
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :onyx_p_n, type: String
  field :type, type: String
  field :description, type: String
  field :p_n, type: String
  field :substitute_code, type: String
  field :substitute_p_n, type: String
  field :reference, type: String
  field :footprint, type: String
  field :mark, type: String
  field :substitute_mark, type: String
  field :remark, type: String
  field :manufacture, type: String
  field :quantity, type: Integer
  field :document, type: String
  field :version, type: String
  field :state, type: String
  
  belongs_to :materiale
  belongs_to :bom
end
