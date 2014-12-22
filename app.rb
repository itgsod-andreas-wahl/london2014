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
    params['owner'] = "Anonymous" if params['owner'] == ""
    Comment.create({image_id: image_id, content: params['comment'], owner: params['owner']})
    redirect '/'
  end

  get '/tags/*' do
    @images = []
    splat = params[:splat].first.split('/')

    @images = splat.map {|tag| ImageTag.all(tag: Tag.first(name: tag)).images}
    @images = @images.inject(:&)

    slim :index
  end

  post '/tags/' do
    @images = []

    tags = params['tag'].split(', ')*"/"
    redirect "/tags/#{tags}"
  end

end

