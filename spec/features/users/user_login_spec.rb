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

  describe 'login page Part #1' do
    it 'has a cookie implemented' do
      user = User.create(name: "Test User", email: "test@example.com", password: "password")

      # Visit the login page
      visit login_path
  
      # Fill in login form
      # save_and_open_page
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      fill_in "Location", with: "Denver, CO"
      
      # Click on the login button
      click_button "Log In"
      
      # save_and_open_page
      # Expect to be redirected to the user's landing page
      expect(page).to have_current_path(user_path(user.id))
  
      # Expect to see the entered location on the landing page
      expect(page).to have_content("Denver, CO")
  
      # Log out
      click_link "Log out"
  
      # Expect to be redirected to the login page after logout
      expect(page).to have_current_path(login_path)
  
      # Visit the login page again
      visit login_path
  
      # Expect the location field to be pre-filled with the previously entered location
      expect(find_field('Location').value).to eq "Denver, CO"
    
    end
  end


end 