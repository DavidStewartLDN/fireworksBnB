require "sinatra"
require "sinatra/activerecord"

require_relative "./models/booking"
require_relative "./models/space"
require_relative "./models/user"

set :database, "sqlite3:fireworksbnb.sqlite3"
enable :sessions

class FireworksBnB < Sinatra::Base
  get "/" do
    # this is how you bring in database models. this returns all lines in each table for each class and saves it as an instance variable
    @users = User.all
    @spaces = Space.all
    @bookings = Booking.all
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    user = User.sign_up(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    if user.save
      redirect "/home"
    else
      redirect "/oops"
    end
  end

  get "/home" do
    # this one throws error Couldn't find User without an ID
    # MUST LOOK AT SESSIONS
    # @user = User.find(session[:user_id])
    erb :home
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/home"
    else
      redirect "/oops"
    end
  end

  get "/logout" do
    # clear session hash
    session.clear
    redirect "/"
  end
end
