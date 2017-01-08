class User < Sequel::Model
  many_to_many :frameworks, left_key: :user_id, right_key: :framework_id, join_table: :frameworks_users
  one_to_many :achievements
  one_to_many :works
  mount_uploader :avatar, AvatarUploader

  def before_create
    self.access_token ||= SecureRandom.hex
    super
  end
end