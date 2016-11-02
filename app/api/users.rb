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


end