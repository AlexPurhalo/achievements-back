require 'bcrypt'

class Users < Grape::API
  format :json

  resources :users do
    get '/' do
      User.all
    end

    params do                                                                      # user parameters receiving
      :username
      :enc_password
    end

    desc 'Creates user'
    post '/' do                                                              # POST request to /users address
      @user = User.new params

      errors = Array.new                                            # empty array for errors messages pushing

      if params[:username]                                                              # username validation
        errors.push('username can not be empty') if params[:username].length < 1
        errors.push('username has already taken') if User.find_by(username: params[:username])
        errors.push('only letters and numbers for username') unless /\A[a-z\d]*\Z/i.match(params[:username])
      else
        errors.push('username is required')
      end

      if params[:enc_password]                                                          # password validation
        errors.push('password can not be empty') if params[:enc_password].length < 1
      else
        errors.push('password is required')
      end

      # saves record to DB and shows it's dat if record has the correct params else shows the errors messages
      @user.save ? @user : error!({ errors: errors}, 422)
    end
  end

  resources :sessions do
    params do                                                                      # user parameters receiving
      :username
      :password
    end

    post '/' do
      username, password = params[:username], params[:password]          # stocks username and password params

      errors = Array.new                                 # definition of empty array for future errors passing

      @user = User.where(username: username).first                       # looks for user with passed username

      # params existing validation
      errors.push('username is required') unless username
      errors.push('password is required') unless password

      if username && password
        # email existing validation
        errors.push('user is not exist') unless @user

        # passwords matching validation if user was found
        (errors.push('wrong password') unless BCrypt::Password.new(@user.enc_password) == password) if @user
      end

      # if no errors shows jwt token otherwise shows errors array with: 422  -  "unprocessable entity" status
      errors.length < 1 ? { jwt: @user.access_token} : error!({ errors: errors }, 422)
    end
  end
end