require 'helper_spec'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:enc_password) }

  it {
    should validate_uniqueness_of(:username)
        .with_message('username has already taken')
  }
end