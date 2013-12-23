# coding: utf-8
require 'carrierwave/processing/mini_magick'
class MaterialePicUploader < BaseUploader

include CarrierWave::MiniMagick

  version :small do
    process :resize_to_fill => [24, 24]
  end
  
  version :big do
    process :resize_to_fit => [120, 10000]
  end

  def filename
    super
  end
  
  def extension_white_list
    %w(jpg jpeg png)
  end
end