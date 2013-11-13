class RegisterOrder
  include Mongoid::Document
  include Mongoid::Timestamps
   
  field :register_orders_id, type: String
  field :user, type: String
  field :time, type: String
  field :version, type: String
  field :product, type: String
  field :color, type: String
  field :quantity, type: String
  field :delivery_time, type: String
  field :customer, type: String
  field :remark, type: String
  
  has_one :hardware, :dependent => :destroy
  has_one :software, :dependent => :destroy
  has_one :assembly, :dependent => :destroy
  has_one :fitting, :dependent => :destroy
  has_one :packaging_material, :dependent => :destroy
  has_one :packaging_requirement, :dependent => :destroy
  accepts_nested_attributes_for :hardware, :software, :assembly, :fitting, :packaging_requirement, :packaging_material
end
