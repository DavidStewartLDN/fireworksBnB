feature 'user is able to book a space' do
  scenario 'user can get to a page to book a specific space' do
    create_users
    owner_login
    list_space
    traveller_login
    expect(page).to have_content("Lovely old house")
    click_button("Book Lovely old house")
    expect(page).to have_content("Request Booking")
  end

  scenario 'user gets confirmation a request was made' do
    users_log_in_list_space_request_booking
    expect(page).to have_content("Request sent")
    expect(page).to have_content("Your current bookings for this property are")
    expect(page).to have_content("2020-02-27")
    expect(page).to have_content("2020-02-28")
  end
end
