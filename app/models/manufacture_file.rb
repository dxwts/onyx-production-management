class ManufactureFile
  include Mongoid::Document
  field :type, type: String
  mount_uploader :manufacture_file, ManufactureFileUploader
  belongs_to :manufacture
end
