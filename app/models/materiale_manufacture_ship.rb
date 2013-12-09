class MaterialeManufactureShip
  include Mongoid::Document
  field :price, type: Float
  field :delivery_time, type: String
end
