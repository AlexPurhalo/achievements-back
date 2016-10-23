require 'helper_spec'

describe 'POST users' do
  def app
    Users
  end

  describe 'positive specs' do
    before do
      post '/users', username: 'Alex', enc_password: 'XJQBMKQQNt96ulGwzeQ='
    end

    it 'has a username' do
      expect(last_response.body).to include('Alex'.to_json)
    end

    it 'has a password' do
      expect(last_response.body).to include('XJQBMKQQNt96ulGwzeQ='.to_json)
    end
  end

  describe 'negative specs' do
    describe 'parameters existing in request' do
      before do
        post '/users'
      end

      it 'is not include username error' do
        expect(last_response.body).to include('username is required'.to_json)
      end

      it 'is not include password error' do
        expect(last_response.body).to include('password is required'.to_json)
      end
    end

    describe 'parameters emptiness' do
      before do
        post '/users', username: '', enc_password: ''
      end

      it 'empty username error' do
        expect(last_response.body).to include('username can not be empty'.to_json)
      end

      it 'empty password error' do
        expect(last_response.body).to include('password can not be empty'.to_json)
      end
    end

    describe 'other params validation' do
      it 'username uniqueness ' do
        post '/users', username: 'UserToExist', enc_password: 'XJQBMKQQNt96ulGwzeQ='
        post '/users', username: 'UserToExist', enc_password: 'XJQBMKQQNt96ulGwzeQ='

        expect(last_response.body).to include('username has already taken'.to_json)
      end
    end
  end
end