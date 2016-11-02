require 'helper_spec'

describe 'POST session' do
  def app
    App
  end

  describe 'positive specs' do
    it 'renders jwt after passing of the correct username and password params' do
      post '/users', username: 'AlexP', enc_password: '$2a$10$wJWNvkkeFdKedov9BKKGrOx7JrkRtbNAlgkSCt9zkozSSqL7nUV42'
      post '/sessions', username: 'AlexP', password: '228228'

      expect(last_response.body).to include('jwt')
    end
  end

  describe 'negative specs' do
    before do
      post '/users', username: 'AlexP', enc_password: '$2a$10$wJWNvkkeFdKedov9BKKGrOx7JrkRtbNAlgkSCt9zkozSSqL7nUV42'
    end

    describe 'parameters existing specs' do
      it 'username is required error' do
        post '/sessions', password: '1231238'

        expect(last_response.body).to include('username is required'.to_json)
      end

      it 'password is required error' do
        post '/sessions', username: 'AlexP'

        expect(last_response.body).to include('password is required'.to_json)
      end

      it 'both username adn password are required errros' do
        post '/sessions'

        expect(last_response.body).to include('password is required'.to_json, 'username is required'.to_json)
      end
    end

    describe 'validation for passed parameters' do
      it 'user is not exist error' do
        post '/sessions', username: 'Valik228', password: '228228'

        expect(last_response.body).to include('user is not exist')
      end

      it 'wrong password error' do
        post '/sessions', username: 'AlexP', password: 'badpwssword'

        expect(last_response.body).to include('wrong password')
      end
    end
  end
end