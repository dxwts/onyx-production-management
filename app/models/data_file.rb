class DataFile
  include Mongoid::Document
  mount_uploader :data_file, DataFileUploader
end
