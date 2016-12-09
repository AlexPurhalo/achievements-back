class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
  # u = User.new
  # u.avatar = File.open('my_file.png')
end