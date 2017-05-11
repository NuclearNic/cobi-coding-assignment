# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  after :store, :after_store
  after :remove, :remove_base_64

  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def after_store(file)
    if self.file.present? and self.file.exists?
      Rails.env.production? ? file_contents = open(self.url) {|f| f.read} : file_contents = open(self.path) {|f| f.read}
      file_contents_base_64 = "data:image/#{self.file.extension},base64," + Base64.strict_encode64(file_contents)
      self.model.update_attribute((self.mounted_as.to_s + "_base_64"), file_contents_base_64)
    else
      self.model.update_attribute(self.mounted_as,nil)
    end
  end

  def remove_base_64
    self.model.update_attribute((self.mounted_as.to_s + "_base_64").to_sym,nil) unless self.model.destroyed?
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
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
