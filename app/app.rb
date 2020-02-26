require "sinatra"
require "sinatra/activerecord"

require_relative "./models/booking"
require_relative "./models/space"
require_relative "./models/user"


# DB_ENV ='development'
# connection_details =YAML::load(File.open('./config/database.yml'))
# ActiveRecord::Base.establish_connection(connection_details[DB_ENV])

# set :database, "sqlite3:fireworksbnb.sqlite3"

class FireworksBnB < Sinatra::Base


  #   # this is how you bring in database models. this returns all lines in each table for each class and saves it as an instance variable
  enable :sessions

  # home page 

  get '/' do
    @users = User.all
    @spaces = Space.all
    @bookings = Booking.all
    @testing_user = session[:user]
    erb :index
  end

  # # login to users account

  get '/login' do
    erb :login
  end

  post '/add_user/new' do
    session[:user] = params["new_user_name"]
    session[:password] = params["new_password"]
    new_user = User.create(username: params["new_user_name"], password: params["new_password"])
    redirect '/login'
  end

  get '/sign_up' do
    erb :sign_up
  end

end
