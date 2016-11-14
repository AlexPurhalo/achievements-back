require 'helper_spec'

describe 'GET user' do
  def app
    Users
  end

  before do
    post '/users', username: 'AlexP', enc_password: '$2a$10$wJWNvkkeFdKedov9BKKGrOx7JrkRtbNAlgkSCt9zkozSSqL7nUV42'
    get '/users/1/'
  end



  describe 'the positive specs' do
    describe 'includes the correct objects with keys' do
      it 'include a user id' do
        expect(last_response.body).to include('id')
      end

      it 'include a username' do
        expect(last_response.body).to include('username')
      end
    end

    describe 'the keys have the correct values' do
      it 'username key has a correct value' do
        expect(last_response.body).to include('AlexP'.to_json)
      end

      it 'id key has a correct value' do
        expect(last_response.body).to include(1.to_json)
      end
    end
  end

  describe 'the negative specs' do
    describe 'exclude the hidden keys' do
      it 'not include jwt' do
        expect(last_response.body).not_to include('jwt')
      end

      it 'not include a password' do
        expect(last_response.body).not_to include('password')
      end
    end

    it 'shows error about not existing user with 500 status' do
      get '/users/1488/'

      expect(last_response.status).to eq(500)
      expect(last_response.body).to include('user is not exist'.to_json)
    end
  end

  describe 'the headers spec' do
    it 'has a 200 status' do
      expect(last_response.status).to eq(200)
    end
  end
end