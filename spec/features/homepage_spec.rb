feature 'view welcome home page' do 
  scenario 'Basic greeting on home page' do
    visit('/')
    expect(page).to have_content('Welcome to FireworksBnB')
  end 
  scenario 'home page has log in and sign up links' do
    visit('/')
    click_link('Log in')
    expect(page).to have_content('Please enter your account details')
  end 
end