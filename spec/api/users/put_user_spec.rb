require 'helper_spec'

describe 'PUT user' do
  def app
    Users
  end

  before { Users.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    put '/users/1', id: 1, username: 'Lord228'
  end

  it 'has a correct data' do
    expect(last_response.body).to eq({ username: 'Lord228', id: 1 }.to_json)
  end
end