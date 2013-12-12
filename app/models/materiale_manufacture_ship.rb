class MaterialeManufactureShip
  include Mongoid::Document
  field :price, type: Float
  field :delivery_time, type: String
  field :manufacture_id, type: String
  belongs_to :materiale
  belongs_to :manufacture
end
