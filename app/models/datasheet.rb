class Datasheet
  include Mongoid::Document
  
  mount_uploader :datasheet, DocumentUploader
  belongs_to :materiale
end
