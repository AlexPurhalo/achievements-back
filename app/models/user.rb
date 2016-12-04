class User < ActiveRecord::Base
  # password validation
  validates :enc_password, presence: true

  # username validation
  validates :username, presence: true,
            uniqueness: true,
            format: /\A[a-z\d]*\Z/i

  before_create :generate_token

  has_and_belongs_to_many :frameworks

  protected
  def generate_token
    self.access_token = SecureRandom.urlsafe_base64
    generate_token if User.exists?(access_token: self.access_token)
  end
end