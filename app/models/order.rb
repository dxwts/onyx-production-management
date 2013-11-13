class Order
  include Mongoid::Document
  field :order_id, type: String
  field :user, type: String
  field :time, type: String
  field :version, type: String
  field :product, type: String
  field :color, type: String
  field :quantity, type: Integer
  field :delivery_time, type: String
  field :customer, type: String
  field :remark, type: String
end
