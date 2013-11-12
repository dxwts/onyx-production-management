class Software
  include Mongoid::Document
  field :os, type: String
  field :boot_anim, type: String
  field :standby_anim, type: String
  field :poweroff_anim, type: String
  field :language, type: String
  field :software_features, type: String
  field :remark, type: String
  
  belongs_to :register_order
end
