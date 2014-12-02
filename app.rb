class App < Sinatra::Base

  get '/' do
    @images = Image.all

    slim :index
  end

  post '/rate/:image_id' do |image_id|
    Assessment.create({image_id: image_id, rating: params['rating']})
    redirect '/'
  end

  get '/tags/*' do
    @images = []

    params[:splat].each do |tag|
      @images << ImageTag.all(tag: Tag.first(name: tag)).images
    end

    @images = @images.flatten.uniq

    slim :index
  end

  post '/tags/*' do
    @images = Image.all(tags: {name: params['tag']})

    slim :index
  end

end