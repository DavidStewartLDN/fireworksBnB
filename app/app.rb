require "sinatra"
require "sinatra/activerecord"

require_relative "./models/booking"
require_relative "./models/space"
require_relative "./models/user"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'fireworksbnb')

class FireworksBnB < Sinatra::Base
  # get "/" do
  #   # this is how you bring in database models. this returns all lines in each table for each class and saves it as an instance variable
  #   @users = User.all
  #   @spaces = Space.all
  #   @bookings = Booking.all
  #   erb :list_all
  # end

  enable :sessions

  get '/' do
    erb :index
  end

  # # login to users account

  get '/login' do
    erb :login
  end

  get '/sign_up' do
    erb :sign_up
  end

  # # Verify login details against database

  # post '/login/validate' do
  #   # session[:user_entered] = params["username"]
  #   # session[:password_entered] = params["password"]
  #   # redirect '/list_all'

  #   if (User.exists?(username: params["username"], password: params["password"]))
  #     session[:user_id] = User.find_by(username: params["username"]).id
  #     session[:user] = params["username"]
  #     redirect '/list_all'
  #   else
  #     redirect '/login'
  #   end
  # end

  # # Main page listing all users, spaces and bookings

  # get '/list_all' do
  #   # @user_entered = session[:user_entered]
  #   # @password_entered = session[:password_entered]
  #   @current_user = session[:user]
  #   @user_id = session[:user_id]
  #   @users = User.all
  #   @spaces = Space.all
  #   @bookings = Booking.all
  #   erb :list_all
  # end

  # # Add new user

  # get '/add_user' do
  #   erb :add_user
  # end

  # post '/add_user/new' do
  #   new_user = User.create(username: params[:new_user_name], password: params[:new_password])
  #   redirect '/list_all'
  # end  
end
