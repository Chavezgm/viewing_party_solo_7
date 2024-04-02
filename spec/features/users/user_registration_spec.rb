require "rails_helper"

RSpec.describe "User registration form" do
  it "creates new user" do
    visit "/register"


    name = "funbucket13"
    password = "test"
    # password = "test"
    email = 'email@gmail.com'
    # save_and_open_page
    fill_in :user_name, with: name
    fill_in :user_password, with: "test123"
    fill_in :user_password_confirmation, with: "test123"
    fill_in :user_email, with: email

    # save_and_open_page
    click_on "Create New User"

    expect(page).to have_content("Welcome, #{name} you have now been registered!")
  end

  it "creates new user SAD PATH" do
    visit "/register"


    name = "funbucket13"
    password = "test"
    # password = "test"
    email = 'email@gmail.com'
    # save_and_open_page
    fill_in :user_name, with: name
    fill_in :user_password, with: "test12"
    fill_in :user_password_confirmation, with: "test123"
    fill_in :user_email, with: email

    # save_and_open_page
    click_on "Create New User"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end


end