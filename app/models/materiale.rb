class Materiale
  include Mongoid::Document
  include Mongoid::Timestamps

  field :item, type: Integer
  field :onyx_p_n, type: String
  field :type, type: String
  field :description, type: String
  field :p_n, type: String
  field :substitute_code, type: String
  field :substitute_p_n, type: String
  field :footprint, type: String
  field :mark, type: String
  field :level, type: String
  field :remark, type: String
  field :manufacture, type: String
  field :quantity, type: Integer, default: 0
  field :lower_limit, type: Integer, default: 0
  field :role, type: String

  has_many :materiales_event
end
