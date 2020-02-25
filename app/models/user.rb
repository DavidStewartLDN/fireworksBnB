class User < ActiveRecord::Base
  has_many :spaces
  has_many :bookings

  attr_reader :username, :password

  # this creates a new user successfuly with username and password
  # at the moment it passes it to the main db
  def self.sign_up(username:, password:)
    @username = username
    @password = password
    self.create(username: username, password: password)
  end
end
