class Sessions < Grape::API
  format :json

  resources :sessions do
    get '/' do
      'gogo'
    end

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
      errors.length < 1 ? { jwt: @user.access_token, id: @user.id } : error!({ errors: errors }, 422)
    end
  end
end