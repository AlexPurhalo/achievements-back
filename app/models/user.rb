class User < ActiveRecord::Base
  validates :enc_password, presence: true
  validates :username, presence: true, uniqueness: { message: 'username has already taken' }

  before_create :generate_token

  protected
  def generate_token
    self.access_token = SecureRandom.urlsafe_base64
    generate_token if User.exists?(access_token: self.access_token)
  end
end