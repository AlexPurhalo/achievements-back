class Frameworks < Grape::API
  resources :frameworks do
    get '/', rabl: 'frameworks/index' do
      @frameworks = Framework.all
    end

    post '/', rabl: 'frameworks/show'  do
      errors = Array.new
      @framework = Framework.where(name: params[:framework]).first
      @framework && errors.push('this framework is already exist')

      errors.length > 0 ?
          error!({ errors: errors}, 422) :
          (@framework = Framework.create(name: params[:framework]))
    end
  end
end