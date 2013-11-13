class Fitting
  include Mongoid::Document
  field :adapter, type: String
  field :adapter_sticker, type: String
  field :data_line, type: String
  field :headphone, type: String
  field :tf_card, type: String
  field :holster, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
