class App < Sinatra::Base

  get '/' do
    @images = Image.all

    slim :index
  end

  post '/rate/:image_id' do |image_id|
    Assessment.create({image_id: image_id, rating: params['rating']})
    redirect '/'
  end

  post '/comment/:image_id' do |image_id|
    Comment.create({image_id: image_id, content: params['comment']})
    redirect '/'
  end

  get '/tags/*' do
    @images = []
    splat = params[:splat].first.split('/')

    splat.each do |tag|
      @images << ImageTag.all(tag: Tag.first(name: tag)).images
    end

    @images = @images.flatten.uniq

    slim :index
  end

  post '/tags/' do
    @images = []

    tags = params['tag'].split(', ')

    if tags.is_a? Array
      tags.each do |tag|
        @images << ImageTag.all(tag: Tag.first(name: tag)).images
      end
    else
      @images << ImageTag.all(tag: Tag.first(name: params['tag'])).images
    end

    @images = @images.flatten.uniq

    slim :index
  end

end