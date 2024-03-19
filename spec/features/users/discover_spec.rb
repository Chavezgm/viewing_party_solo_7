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
    save_and_open_page
    expect(page).to have_button('Search')
    

  end
end