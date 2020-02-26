feature 'view welcome home page' do 
  scenario 'Basic greeting on home page' do
    visit('/')
    expect(page).to have_content('Welcome to FireworksBnB')
  end 
end