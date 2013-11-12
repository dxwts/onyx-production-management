class Hardware
  include Mongoid::Document
  field :cpu, type: String
  field :ram, type: String
  field :flash, type: String
  field :screen, type: String
  field :wireless, type: String
  field :touch_type, type: String
  field :battery_capacity, type: String
  field :connector, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
