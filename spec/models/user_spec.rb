require 'helper_spec'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:enc_password) }

  it { should validate_uniqueness_of(:username) }

  it { should allow_value('CorrectName123').for(:username) }

  it { should_not allow_value('*Incorrect!Name$').for(:username)}

  it 'generates a jwt for user' do
    user = User.create(username: 'AlexP', enc_password: 'lol')
    expect(user.access_token).to be_truthy
  end
end