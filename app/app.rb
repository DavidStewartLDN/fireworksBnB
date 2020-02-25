require "sinatra"
require "sinatra/activerecord"

require_relative "./models/booking"
require_relative "./models/space"
require_relative "./models/user"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'fireworksbnb')

class FireworksBnB < Sinatra::Base
  get "/" do
    # this is how you bring in database models. this returns all lines in each table for each class and saves it as an instance variable
    @users = User.all
    @spaces = Space.all
    @bookings = Booking.all
    erb :index
  end
end
