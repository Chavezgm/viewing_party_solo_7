require "rails_helper"


RSpec.describe "Logging In happy path" do
  it "can log in with valid credentials" do
    user = User.create(name: "pasta boi", email: "email@gmail.com", password: "test")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user.id))

    expect(page).to have_content("Welcome, #{user.name}")
  end

  it "can log in with INVALID credentials SAD PATH" do
    user = User.create(name: "pasta boi", email: "email@gmail.com", password: "test")

    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: "123"

    click_on "Log In"

    expect(current_path).to eq(login_path)
    
    expect(page).to have_content("You entered Incorrect Credentials")
  end


end 