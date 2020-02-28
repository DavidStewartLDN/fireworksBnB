feature 'user is able to see their spaces' do
  scenario 'user can be redirected correctly to see their spaces' do

    User.create(username: 'Owner', password: 'potato')

    # Log in to user Owner
    
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_link('Manage my spaces')

    expect(page).to have_content('My current listings')

  end

  scenario 'user can see current pending rquests for their property with dates' do

    User.create(username: 'Owner', password: 'potato')
    User.create(username: 'Traveller', password: 'potato')
    
    # Owner logs in

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    # Owner creates space

    click_link('List a Space')
    fill_in 'new_space_name', with: 'Lovely old house'
    fill_in 'new_space_description', with: 'When I was a young child, I used to live in this house with my dear friend Ralph'
    fill_in 'new_price', with: '1000'
    click_button('List my Space')

    # Traveller logs in and books space

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Traveller'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_button('Book Lovely old house')

    fill_in 'start_date', with: '2020-02-27'
    fill_in 'end_date', with: '2020-02-28'
    click_button('Request Dates')

    # Owner logs in and views 

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_link('Manage my spaces')

    expect(page).to have_content('My current listings')
    expect(page).to have_content('Lovely old house')
    expect(page).to have_content('2020-02-27')
    expect(page).to have_content('2020-02-28')
    expect(page).to have_content('Pending')
  
  end

  scenario 'user can see current pending rquests and press button to confirm request' do

    User.create(username: 'Owner', password: 'potato')
    User.create(username: 'Traveller', password: 'potato')
    
    # Owner logs in

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    # Owner creates space

    click_link('List a Space')
    fill_in 'new_space_name', with: 'Lovely old house'
    fill_in 'new_space_description', with: 'When I was a young child, I used to live in this house with my dear friend Ralph'
    fill_in 'new_price', with: '1000'
    click_button('List my Space')

    # Traveller logs in and books space

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Traveller'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_button('Book Lovely old house')

    fill_in 'start_date', with: '2020-02-27'
    fill_in 'end_date', with: '2020-02-28'
    click_button('Request Dates')

    # Owner logs in and views 

    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'Owner'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_link('Manage my spaces')

    click_button('Confirm')

    expect(page).to have_content('My current listings')
    expect(page).to have_content('Lovely old house')
    expect(page).to have_content('2020-02-27')
    expect(page).to have_content('2020-02-28')
    expect(page).to have_content('Confirmed')
  
  end
end