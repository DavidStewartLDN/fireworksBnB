feature 'user is able to log in' do
  scenario 'user can enter name currently in test databse and login' do
    User.create(username: 'owner@owner.com', password: 'potato')
    owner_login
    expect(page).to have_content("Welcome to FireworksBnB")
  end
end
