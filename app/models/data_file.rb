class DataFile
  include Mongoid::Document
  mount_uploader :data_file, DataFileUploader
  validates :data_file, presence: true
end
