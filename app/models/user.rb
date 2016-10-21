class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  before_create :generate_token

  protected
  def generate_token
    self.access_token = SecureRandom.urlsafe_base64
    generate_token if User.exists?(access_token: self.access_token)
  end
end