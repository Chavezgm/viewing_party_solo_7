require "rails_helper"


RSpec.describe "Discover movies" do

  it 'should have movies' do
    user = User.create(name: "loop", email: "loop@email.org", id: 234)
    # When I visit the '/users/:id/discover' path (where :id is the id of a valid user),
    visit "/users/#{user.id}/discover"
    # I should see
    # - a Button to Discover Top Rated Movies
    expect(page).to have_button('Top Rated Movies')
    # - a text field to enter keyword(s) to search by movie title
    expect(page).to have_field(:title)
    # - a Button to Search by Movie Title
    # save_and_open_page
    expect(page).to have_button('Search')
    

  end

  describe 'US 2 ' do
    it 'Movie Results', :vcr do
      user = User.create(name: "loop", email: "loop@email.org", id: 234)

      visit "/users/#{user.id}/discover"

      click_button('Top Rated Movies')

      expect(current_path).to eq("/users/#{user.id}/movies")

      # save_and_open_page

      expect(page).to have_link("The Shawshank Redemption")

      expect(page).to have_content('Vote Average: 8.7')
      
      # save_and_open_page
      expect(page).to have_button('Return to the Discover Page')
      click_button('Return to the Discover Page')

      expect(current_path).to eq("/users/#{user.id}/discover")

      
      # - Title (As a Link to the Movie Details page (see story #3))
      # - Vote Average of the movie
      
      # I should also see a button to return to the Discover Page. 

    end

    it 'Search', :vcr do
      user = User.create(name: "loop", email: "loop@email.org", id: 234)

      visit "/users/#{user.id}/discover"

      fill_in :title, with: "The Shawshank Redemption"

      click_button("Search")


      expect(current_path).to eq("/users/#{user.id}/movies")
      # save_and_open_page

      expect(page).to have_link('The Shawshank Redemption')

      expect(page).to have_button('Return to the Discover Page')
      click_button('Return to the Discover Page')

      expect(current_path).to eq("/users/#{user.id}/discover")


    end
  end
  
end