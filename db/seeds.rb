user_list = [
  ["a", "a"],
  ["potato", "potato"],
  ["owner", "potato"],
  ["traveller", "potato"],
]

user_list.each do |username, password|
  User.create(username: username, password: password)
end

space_list = [
  ["really nice home", "truly lovely home lorem ipsum dolor sit amet", User.find_by(id: 1)],
  ["another really nice home", "lovely home lorem ipsum dolor sit amet", User.find_by(id: 2)],
  ["one more nice home", "an ok home lorem ipsum dolor sit amet", User.find_by(id: 3)],
]

space_list.each do |title, description, price, user|
  Space.create(title: title, description: description, user: user)
end

# not sure if using correct formats below:

# booking_list = [
#     ["2020-04-12", User.find_by(id: 4), Space.find_by(id: 1), "pending"],
#     ["2020-05-05", User.find_by(id: 4), Space.find_by(id: 2), "pending"],
#     ["2020-06-28", User.find_by(id: 3), Space.find_by(id: 3), "pending"],
#   ]

#   booking_list.each do |date, user, space, confirmed|
#     Booking.create( booking_date: date, user: user, space: space, status: status)
#   end
