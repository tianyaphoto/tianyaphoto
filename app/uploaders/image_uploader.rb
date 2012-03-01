# -*- encoding : utf-8 -*-
require "digest/md5"
require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :grid_fs
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:

#  process :resize_to_limit => [680, nil]
#
#  version :normal do
#    process :resize_to_fill => [200,300]
#  end
  
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
#  version :thumb do
#    process :resize_to_limit => [50, 50]
#  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  # Override the filename of the uploaded files:
  #def filename
  #  if super.present?
  #    ext = File.extname(original_filename)
  #    fname = Digest::MD5.hexdigest(self.read)
  #    @name ||= "#{fname}#{ext}"
  #  end
  #end

end
