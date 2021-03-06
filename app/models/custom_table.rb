class CustomTable
  include Mongoid::Document
  
  field :name, :type => String
  field :column, :type => String, default: ""
  
  validates :name, presence: true
  validates_uniqueness_of :name
  
  belongs_to :user
end
