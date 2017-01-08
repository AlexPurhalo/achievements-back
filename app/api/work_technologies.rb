class Technologies < Grape::API
  resources :users do
    post '/:user_id/works/:work_id/technologies/', rabl: 'technologies/index' do
      @technology = Technology.create(name: params[:technology])
      @work = Work[params[:work_id]]
      @work.add_technology(@technology)
      @technologies = @work.technologies
    end

    put '/:user_id/works/:work_id/technologies/:technology_id', rabl: 'technologies/index' do
      @technology, @work = Technology[params[:technology_id]], Work[params[:work_id]]
      @technology.technology = params[:technology]
      @technology.save
      @technologies = @work.technologies
    end

    delete '/:user_id/works/:work_id/technologies/:technology_id', rabl: 'technologies/index' do
      @technology, @work = Technology[params[:technology_id]], Work[params[:work_id]]
      @technology.destroy
      @technologies = @work.technologies
    end
  end
end