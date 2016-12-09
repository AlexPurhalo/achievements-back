class AvatarUploader < CarrierWave::Uploader::Base
  storage :fog
  # u = User.new
  # u.avatar = File.open('my_file.png')
  # def store_dir
  #   'uploads/avatars'
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end