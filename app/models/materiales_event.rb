class MaterialesEvent
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user, type: String
  field :obj, type: String
  field :event, type: String
  field :quantity, type: Integer
  field :remark, type: String
  belongs_to :materiale
end
