class Manufacture
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :tel, type: String
  field :remark, type: String
  
  has_many :manufacture_files, :dependent => :destroy
  has_many :materiale_manufacture_ships, :dependent => :destroy
  accepts_nested_attributes_for :manufacture_files, :allow_destroy => true
end
