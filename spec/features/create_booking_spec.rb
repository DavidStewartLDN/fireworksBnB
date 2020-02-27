feature 'user is able to book a space' do
  scenario 'user can get to a page to book a specific space' do

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


    expect(page).to have_content('Lovely old house')
    
    click_button('Book Lovely old house')

    expect(page).to have_content('Request Booking')
  

  end

  scenario 'user gets confirmation a request was made' do

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


    expect(page).to have_content('Lovely old house')
    
    click_button('Book Lovely old house')

    fill_in 'start_date', with: '27/02/20'
    fill_in 'end_date', with: '28/02/20'
    click_button('Request Dates')

    expect(page).to have_content('Request sent')
    # expect(page).to have_content('27/02/20')
    # expect(page).to have_content('28/02/20')

    # We need to create test to confirm that the page you are requesting booking for is for the correct space

  end
end