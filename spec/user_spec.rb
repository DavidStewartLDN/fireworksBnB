require_relative "../app/models/user"

describe User do

  # this test puts users into the main db
  # the test fails because it expexts "a" but it reads nil
  it "creates a new user" do
    user = User.create(username: "a", password: "b")
    expect(user.username).to eq "a"
    expect(user.password).to eq "b"
  end
end
