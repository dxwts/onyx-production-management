class Acknowledgement
  include Mongoid::Document
  
  mount_uploader :acknowledgement, DocumentUploader
  belongs_to :materiale
end
