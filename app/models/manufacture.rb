class Manufacture
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :tel, type: String
  field :remark, type: String
  
  has_many :materiale_manufacture_ships, :dependent => :destroy
end
