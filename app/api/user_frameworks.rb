class UserFrameworks < Grape::API
  resources :users do
    post '/:id/frameworks' do
      errors = Array.new
      @user = User.find(params[:id])

      @framework = Framework.where(framework: params[:framework]).first

      if @framework
        @user.frameworks.map do |framework|
          framework[:framework] == params[:framework] && errors.push('user is already have this framework')
        end

        errors.length < 1 && @user.frameworks.push(@framework)
      else
        @framework = Framework.create(framework: params[:framework])
        @user.frameworks.push(@framework)
      end
      errors.length > 0 ? error!({ errors: errors}, 422) : @user.frameworks
    end

    get '/:id/frameworks' do
      @user = User.find(params[:id])
      @user_frameworks = @user.frameworks
    end

    delete '/:id/frameworks/:id' do
      user_id, framework_id = params[:id][0], params[:id][1]

      @user = User.find(user_id)
      @framework = Framework.where(id: framework_id).first
      @user.frameworks -= [@framework] # destroys framework from other
      @user.save
      @framework.users.count < 1 && @framework.destroy # destroys framework if it doesn't belong to any user
      @user.frameworks
    end
  end
end