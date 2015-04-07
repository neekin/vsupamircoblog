# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
   def store_dir
     "uploads/#{model.class.to_s.underscore}/#{model.photobook.bookname}"
   end
  #定义临时文件夹
   def cache_dir
     "#{Rails.root}/tmp/uploads"
   end
   version :big do
     process :resize_to_limit => [800, 800]
   end
   version :thumb do
     process :resize_to_limit => [360, 360]
   end
   version :small do
     process :resize_to_fit => [80, 80]
   end

  #指定上传格式
   def extension_white_list
     %w(jpg jpeg gif png)
   end
   def filename
     if original_filename
       # current_path 是 Carrierwave 上传过程临时创建的一个文件，有时间标记
       # 例如: /Users/jason/work/ruby-china/public/uploads/tmp/20131105-1057-46664-5614/_____2013-11-05___10.37.50.png
       # @name ||= Digest::SHA1.hexdigest(current_path)
       "#{model.filename}.#{file.extension}"
     end
   end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
