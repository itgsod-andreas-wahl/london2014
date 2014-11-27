class App < Sinatra::Base

  get '/' do
    @images = Image.all

    slim :index
  end

  post '/rate/:image_id' do |image_id|
    Assessment.create({image_id: image_id, rating: params['rating']})
    redirect '/'
  end

end