require 'sinatra/base'
require './lib/birthday_calculator'

class Birthday < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/save_data' do
    session[:name] = params[:name]
    session[:day] = params[:day]
    session[:month] = params[:month]
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    @day = session[:day]
    @month = session[:month]
    @birthday_calculator = BirthdayCalculator.new(@day, @month)
    erb(:birthday)
  end

  run! if app_file == $0
end
