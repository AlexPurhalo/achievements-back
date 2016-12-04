require 'helper_spec'

describe 'POST framework for user' do
  def app
    App
  end

  # before { App.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    post '/users/1/frameworks/', framework: 'Grape'
    post 'users/1/frameworks/', framework: 'Rails'
  end

  it 'pushes framework to list of user frameworks' do
    user_frameworks_list = [{ id: 1, framework: 'Grape'}, { id: 2, framework: 'Rails' }]

    expect(last_response.body).to eq(user_frameworks_list.to_json)
  end

  it 'pushes new framework to tables of them' do
    get '/frameworks'

    frameworks_list = [{ id: 1, framework: 'Grape'}, { id: 2, framework: 'Rails' }]
    expect(last_response.body).to eq(frameworks_list.to_json)
  end
end