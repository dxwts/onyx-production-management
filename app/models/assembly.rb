class Assembly
  include Mongoid::Document
  field :shell_color, type: String
  field :spray, type: String
  field :key, type: String
  field :stand, type: String
  field :mark, type: String
  field :numbering_sequence, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
