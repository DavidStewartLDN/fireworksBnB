feature 'shows traveller all their bookings' do
  scenario 'traveller has no bookings' do 

    User.create(username: 'Owner', password: 'potato')
    User.create(username: 'Traveller', password: 'potato')

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Traveller'
    fill_in 'password', with: 'potato'
    click_button('Log in')
    click_link('Show my bookings')
    expect(page).to have_content('Your Bookings')
    expect(page).to have_content('You have no bookings')
  end  
  scenario 'traveller has a booking' do 

    User.create(username: 'Owner', password: 'potato')
    User.create(username: 'Traveller', password: 'potato')
    # Log in to user Owner
    
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    # Create Space under Owner account

    click_link('List a Space')
    fill_in 'new_space_name', with: 'Lovely old house'
    fill_in 'new_space_description', with: 'When I was a young child, I used to live in this house with my dear friend Ralph'
    fill_in 'new_price', with: '1000'
    click_button('List my Space')
   
    # Login as Traveller

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Traveller'
    fill_in 'password', with: 'potato'
    click_button('Log in')
    click_button('Book Lovely old house')
    fill_in 'start_date', with: '2020-02-27'
    fill_in 'end_date', with: '2020-02-28'
    click_button('Request Dates')
    click_link('Return to homepage')

    # Actual test of showing all the bookings
    click_link('Show my bookings')
    expect(page).to have_content('Your Bookings')
    expect(page).to have_content('2020-02-27')
    expect(page).to have_content('2020-02-28')
    # expect(page).to have_content('Lovely old house')
  end  
end