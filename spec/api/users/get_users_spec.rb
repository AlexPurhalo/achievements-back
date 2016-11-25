require 'helper_spec'

describe 'GET users' do
  def app
    Users
  end

  before { Users.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    post '/users', username: 'Dispel', enc_password: 'FGQBXKQHNt96uWGwfeO='
    get '/users'
  end

  it 'has a correct body with meta data and users array' do
    expect(last_response.body).to eq(
      {
        users: [ { id: 1, username: 'AlexP' }, { id: 2, username: 'Dispel' }],
        meta: { total_pages: 1, total_objects: 2 }
      }.to_json)
  end

  it 'has a correct - 200 status' do
    expect(last_response.status).to eq(200)
  end
end