class PackagingRequirement
  include Mongoid::Document
  field :box_capacity, type: String
  field :binding, type: String
  field :auxiliary_board, type: String
  field :tape, type: String
  field :box_sticker, type: String
  field :mark_box, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
