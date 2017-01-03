class UserFrameworks < Grape::API
  resources :users do
    post '/:id/frameworks', rabl: 'frameworks/index' do
      user = User[params[:id]]
      framework = Framework.where(name: params[:framework]).first

      if framework == nil
        user.add_framework(Framework.create(name: params[:framework]))
      else
        user.add_framework(framework)
      end

      @frameworks = user.frameworks
    end

    get '/:id/frameworks', rabl: 'frameworks/index' do
      @user = User[params[:id]]
      @frameworks = @user.frameworks
    end

    delete '/:id/frameworks/:id', rabl: 'frameworks/index' do
      user_id, framework_id = params[:id][0], params[:id][1]
      #

      @user = User[user_id]
      @framework = Framework.where(id: framework_id).first
      @user.remove_framework(@framework)
      @framework.users.count < 1 && @framework.destroy # destroys framework if it doesn't belong to any user
      @frameworks = @user.frameworks
    end
  end
end