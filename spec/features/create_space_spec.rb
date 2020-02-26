feature 'user is able to log in' do
  scenario 'user can enter name currently in test databse and login' do

    User.create(username: 'test@test.com', password: 'potato')
    
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'test@test.com'
    fill_in 'password', with: 'potato'
    click_button('Log in')

    click_link('List a Space')
    fill_in 'new_space_name', with: 'Lovely old house'
    fill_in 'new_space_description', with: 'When I was a young child, I used to live in this house with my dear friend Ralph'
    fill_in 'new_price', with: '1000'
    click_button('List my Space')

    expect(page).to have_content('Lovely old house')
    expect(page).to have_content('When I was a young child, I used to live in this house with my dear friend Ralph')
    expect(page).to have_content('1000')
  end
end