class User < ActiveRecord::Base
  has_many :spaces
  has_many :bookings
  # has_secure_password

  def self.sign_up(username:, password:)
    # raise error "user already exists" if username exists in db
    @username = username
    @password = password
    self.create(username: username, password: password)
  end

  def self.log_in(username:, password:)
    # raise error "user does not exist" if username not in db

  end
end
