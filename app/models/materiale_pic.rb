class MaterialePic
  include Mongoid::Document
  mount_uploader :materiale_pic, MaterialePicUploader
  belongs_to :materiale
end
