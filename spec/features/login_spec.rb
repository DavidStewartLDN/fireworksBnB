feature 'user is able to log in' do
  scenario 'user can enter name currently in test databse and login' do

    User.create(username: 'test@test.com', password: 'potato')
    
    visit('/')
    click_link('Log in')
    fill_in 'username', with: 'test@test.com'
    fill_in 'password', with: 'potato'
    click_button('Log in')
    expect(page).to have_content('Welcome to FireworksBnB')
  end
end



# new_user = User.create(username: "Mark", password: "Mark123")