require 'helper_spec'

describe 'GET framework of user' do
  def app
    App
  end

  # before { App.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    post '/users/1/frameworks/', framework: 'Grape'
    post 'users/1/frameworks/', framework: 'Rails'
    get '/users/1/frameworks'
  end
1
  it 'has a 200 status' do
    expect(last_response.status).to eq(200);
  end

  it 'shows user frameworks' do
    user_frameworks_list = [{ id: 1, framework: 'Grape'}, { id: 2, framework: 'Rails' }]

    expect(last_response.body).to eq(user_frameworks_list.to_json)
  end
end