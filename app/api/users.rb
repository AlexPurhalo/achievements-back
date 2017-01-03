class Users < Grape::API
  resources :users do
    include Grape::Kaminari
    paginate per_page: 10

    get '/', rabl: 'users/index' do
      @users = paginate(Kaminari.paginate_array(User.all))
    end

    get '/:id', rabl: 'users/show' do
      @user = User[params[:id]]
    end

    post '/', rabl: 'users/show' do
      @user = User.create(username: params[:username], password: params[:password])

    end

    put '/:id', rabl: 'users/show' do
      @user = User[params[:id]]
      params[:email] && (@user.email = params[:email])
      params[:avatar] && (@user.avatar = params[:avatar])
      params[:city] && (@user.city = params[:city])
      params[:age] && (@user.age = params[:age])
      params[:country] && (@user.country = params[:country])
      params[:profile] && (@user.profile = params[:profile])
      params[:skills] && (@user.skills = params[:skills])
      params[:name] && (@user.name = params[:name])
      params[:phone] && (@user.phone = params[:phone])
      @user.save
    end
  end
end