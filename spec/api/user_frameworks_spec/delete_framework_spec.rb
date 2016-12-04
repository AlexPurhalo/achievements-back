require 'helper_spec'

describe 'POST Framework' do
  def app
    App
  end

  before { App.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    post '/users', username: 'Dispel', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    post '/users/1/frameworks/', framework: 'Rails'
    post '/users/1/frameworks/', framework: 'Grape'
    post '/users/1/frameworks/', framework: 'React'
    post '/users/2/frameworks/', framework: 'Grape'
    post '/users/1/frameworks/', framework: '.NET'
    delete '/users/1/frameworks/2'
    delete '/users/1/frameworks/4'
  end

  it 'cleans framework from list of user frameworks' do
    user_frameworks_list = [{ id: 1, framework: 'Rails' }, { id: 3, framework: 'React' }]
    expect(last_response.body).to eq(user_frameworks_list.to_json)
  end


  it 'destroys framework from framework list if it does belong to any user' do
    get '/frameworks'
    frameworks_list = [
        { id: 1, framework: 'Rails'},
        { id: 2, framework: 'Grape'},
        { id: 3, framework: 'React' }
    ]
    expect(last_response.body).to eq(frameworks_list.to_json)
  end
end
