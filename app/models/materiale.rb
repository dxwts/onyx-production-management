class Materiale
  include Mongoid::Document
  include Mongoid::Timestamps

  field :item, type: Integer
  field :onyx_p_n, type: String
  field :type, type: String
  field :description, type: String
  field :p_n, type: String
  field :substitute_code, type: String
  field :substitute_p_n, type: String
  field :footprint, type: String
  field :mark, type: String
  field :level, type: String
  field :remark, type: String
  field :manufacture, type: String
  field :quantity, type: Integer, default: 0
  field :lower_limit, type: Integer, default: 0
  field :role, type: String
  field :document, type: String
  
  validates :quantity, numericality: { only_integer: true }
  validates :onyx_p_n, :type, :p_n, :footprint, :mark, :level, :manufacture, presence: true
  
  has_many :materiales_event, :dependent => :destroy, order: 'created_at DESC'
  
  TABLE_MAP = {:onyx_p_n => "文石编码", :type => "类型", :description => "描述", :p_n => "料号", :substitute_code => "替代料号", :substitute_p_n => "替代料编号",
                     :footprint => "封装", :mark => "丝印", :level => "物料级别", :remark => "备注", :manufacture => "供应商", :quantity => "数量", :lower_limit => "安全库存",
                      :estimated_quantity => "预估数量"}
  
   def estimated_quantity
     estimated_quantity = materiales_event.to_a.sum{ |item| item.quantity}
     if estimated_quantity < 0
       estimated_quantity = 0
     end
     estimated_quantity
   end
end