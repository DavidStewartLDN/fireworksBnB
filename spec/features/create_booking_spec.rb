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
