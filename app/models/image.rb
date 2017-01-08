class Image < Sequel::Model
  many_to_one :work

  mount_uploader :image, ImageUploader
end