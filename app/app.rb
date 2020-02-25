require "sinatra"
require "sinatra/activerecord"

require_relative "./models/booking"
require_relative "./models/space"
require_relative "./models/user"

set :database, "sqlite3:fireworksbnb.sqlite3"

class FireworksBnB < Sinatra::Base
  get "/" do
    # this is how you bring in database models. this returns all lines in each table for each class and saves it as an instance variable
    @users = User.all
    @spaces = Space.all
    @bookings = Booking.all
    erb :index
  end
end
