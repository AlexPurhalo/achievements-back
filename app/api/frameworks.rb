class Frameworks < Grape::API
  formatter :json, Grape::Formatter::Rabl

  resources :frameworks do
    get '/', rabl: 'frameworks/index' do
      @frameworks = Framework.all
    end

    post '/', rabl: 'frameworks/show'  do
      errors = Array.new
      @framework = Framework.where(framework: params[:framework]).first
      @framework && errors.push('this framework is already exist')

      errors.length > 0 ?
          error!({ errors: errors}, 422) :
          (@framework = Framework.create(framework: params[:framework]))
    end
  end
end