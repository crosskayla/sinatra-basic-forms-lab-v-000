require_relative 'config/environment'
require_relative 'models/puppy.rb'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/new' do
    erb :create_puppy
  end

  post '/create_puppy' do
    puppy = Puppy.new(params[:name], params[:breed], params[:age])
    puts params
    erb :display_puppy
  end

  get '/display_puppy' do
    puppy = Puppy.all.last
    puts puppy
    @name = puppy.name
    @breed = puppy.breed
    @age = puppy.age
    erb :display_puppy
  end


end
