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

  # User sign up and creating accoutn details pages

  get '/sign_up' do
    erb :sign_up
  end

  post '/add_user/new' do
    new_user = User.create(username: params["new_user_name"], password: params["new_password"])
    redirect '/login'
  end

  # login to users account

  get '/login' do
    erb :login
  end

  # validates entered username against database

  post '/login/validate' do
    if (User.exists?(username: params["username"], password: params["password"]))
      session[:user_id] = User.find_by(username: params["username"]).id
      session[:user] = params["username"]
      redirect '/homepage'
    else
      redirect '/login'
    end
  end

  # Main homepage of logged in user

  get '/homepage' do
    @spaces = Space.all
    erb :homepage
  end

  # Add a new space

   get '/add_space' do
    erb :add_space
  end

  post '/add_space/new' do
    new_space = Space.create(property_name: params[:new_space_name], description: params[:new_space_description], price: params[:new_price], user_id: session[:user_id])
    redirect '/homepage'
  end 

end
