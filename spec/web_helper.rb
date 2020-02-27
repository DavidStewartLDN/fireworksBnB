# run function in spec scenarios as required

def users_log_in_list_space_request_booking
  create_users
  owner_login
  list_space
  traveller_login
  request_booking
end

def create_users
  User.create(username: "Owner", password: "potato")
  User.create(username: "Traveller", password: "potato")
end

def owner_login
  visit("/")
  click_link("Log in")
  fill_in "username", with: "Owner"
  fill_in "password", with: "potato"
  click_button("Log in")
end

def list_space
  click_link("List a Space")
  fill_in "new_space_name", with: "Lovely old house"
  fill_in "new_space_description", with: "When I was a young child, I used to live in this house with my dear friend Ralph"
  fill_in "new_price", with: "1000"
  click_button("List my Space")
end

def traveller_login
  visit("/")
  click_link("Log in")
  fill_in "username", with: "Traveller"
  fill_in "password", with: "potato"
  click_button("Log in")
end

def request_booking
  click_button("Book Lovely old house")
  fill_in "start_date", with: "27/02/2020"
  fill_in "end_date", with: "28/02/2020"
  click_button("Request Dates")
end
