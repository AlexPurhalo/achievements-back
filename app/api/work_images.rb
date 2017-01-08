class Images < Grape::API
  resources :users do
    post '/:user_id/works/:work_id/images', rabl: 'images/index' do
      @image, @work = Image.create(image: params[:image]), Work[params[:work_id]]
      @work.add_image(@image)
      @images = @work.images
    end

    put '/:user_id/works/:work_id/images/:image_Id', rabl: 'images/index' do
      @image, @work = Image[params[:image_Id]], Work[params[:work_id]]
      @image.image = params[:image]
      @image.save
      @images = @work.images
    end

    delete '/:user_id/works/:work_id/images/:image_Id', rabl: 'images/index' do
      @image, @work = Image[params[:image_Id]], Work[params[:work_id]]
      @image.destroy
      @images = @work.images
    end
  end
end