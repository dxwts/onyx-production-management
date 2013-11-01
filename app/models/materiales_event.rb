class MaterialesEvent
  include Mongoid::Document
  field :user, type: String
  field :obj, type: String
  field :event, type: String
  field :quantity, type: Integer
  field :remark, type: String
end
