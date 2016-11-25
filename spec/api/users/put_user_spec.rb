require 'helper_spec'

describe 'PUT user' do
  def app
    Users
  end

  before { Users.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/users', username: 'AlexP', enc_password: 'XJQBMKQQNt96ulGwzeQ='
  end

  describe '+ POSITIVE +' do
    before do
      header 'X-Access-Token', User.first.access_token
      put '/users/1', profile: 'Sites builder :D', skills: 'Sexy'
    end

    let (:user_data) { { username: 'AlexP', id: 1, profile: 'Sites builder :D', skills: 'Sexy' } }
    context 'after put request' do
      it 'updates data about user' do
        get '/users/1'
        expect(last_response.body).to eq(user_data.to_json)
      end

      it 'renders serialized data about user' do expect(last_response.body).to eq(user_data.to_json) end
    end
  end

  describe '- NEGATIVE -' do

    context 'does not allow to update data about user if' do
      it 'access token has not been provided' do
        put '/users/1', profile: 'Web Developer', skills: 'Sexy'
        expect(last_response.body).to eq({ errors: ['access token is required']}.to_json)
      end

      it 'headers token and user token not matches' do
        header 'X-Access-Token', 'wrong-access-token'
        put '/users/1', profile: 'Sites builder :D', skills: 'Sexy'
        expect(last_response.body).to eq({ errors: ['person confirmation was failed']}.to_json)
      end
    end
  end
end