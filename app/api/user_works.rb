class UserWorks < Grape::API
  resources :users do
    get '/:id/works', rabl: 'works/index' do
      user = User[params[:id]]
      @works = user.works
    end

    post '/:id/works', rabl: 'works/index'  do
      user = User[params[:id]]
      work = Work.create(
          title: params[:title],
          description: params[:description],
          link_to_app: params[:link_to_app],
          link_to_code: params[:link_to_code],
          release_date: params[:release_date]
      )
      user.add_work(work)
      @works = user.works
    end

    put '/:id/works/:id', rabl: 'works/index' do
      user_id, work_id = params[:id][0], params[:id][1]
      user, work = User[user_id], Work[work_id]
      params[:title] && (work.title = params[:title])
      params[:description] && (work.description = params[:description])
      params[:link_to_app] && (work.link_to_app = params[:link_to_app])
      params[:link_to_code] && (work.link_to_code = params[:link_to_code])
      params[:release_date] && (work.release_date = params[:release_date])
      work.save
      @works = user.works
    end

    delete '/:id/works/:id' do
      user_id, work_id = params[:id][0], params[:id][1]
      user = User[user_id]
      work = Work[work_id]
      work.destroy
      @works = user.works
    end
  end
end