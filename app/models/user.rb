class User < ActiveRecord::Base
  has_many :spaces, dependent: :destroy
  has_many :bookings, dependent: :destroy
end



