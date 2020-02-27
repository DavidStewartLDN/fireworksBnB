feature "view welcome home page" do
  scenario "Basic greeting on home page" do
    visit("/")
    expect(page).to have_content("Welcome to FireworksBnB")
  end
  scenario "home page has a log in link" do
    visit("/")
    click_link("Log in")
    expect(page).to have_content("Please enter your account details")
  end
  scenario "home page has a sign up link" do
    visit("/")
    click_link("Sign Up")
    expect(page).to have_content("Please enter your details")
  end
end
