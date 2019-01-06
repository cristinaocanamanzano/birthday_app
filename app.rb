require 'sinatra/base'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/save_data' do
    session[:name] = params[:name]
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    erb(:birthday)
  end

  run! if app_file == $0
end
