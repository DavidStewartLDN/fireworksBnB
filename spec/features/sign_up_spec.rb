feature 'user is able to sign up' do
  scenario 'User can enter a name' do
    visit('/')
    click_link('Sign Up')
    fill_in 'username', with: 'test@test.com'
    fill_in 'password', with: 'potato'
    click_button('Sign up')
    expect(page).to have_content('Login')
    expect(page).to have_content('Please enter your account details')
  end
end