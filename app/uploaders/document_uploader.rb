# coding: utf-8

class DocumentUploader < BaseUploader
    
  def filename
      super
  end

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end
end