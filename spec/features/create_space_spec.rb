feature 'user is able to log in' do
  scenario 'user can enter name currently in test databse and login' do
    
    create_users
    owner_login
    list_space

    expect(page).to have_content('Lovely old house')
    expect(page).to have_content('When I was a young child, I used to live in this house with my dear friend Ralph')
    expect(page).to have_content('1000')
  end
end