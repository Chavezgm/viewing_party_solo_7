require "rails_helper"

RSpec.describe "Movie details" do

  describe '#US 3' do
    it 'shows movie details', :vcr  do
      user = User.create(name: "loop", email: "loop@email.org")
      movie = MovieFacade.top_rated_movies.first
      #When trying to create a new facade object it gave me errors. Why is that ? 
      
      # When I visit a movie's detail page (`/users/:user_id/movies/:movie_id`) where :id is a valid user id,
      
      
      # require 'pry'; binding.pry
      

      visit "/users/#{user.id}/movies/#{movie[:id]}"

      #Is this the correct way to implement the route? 
      # save_and_open_page

      
      expect(page).to have_button('Create a Viewing Party')
      # - a button to Create a Viewing Party

      expect(page).to have_button('Return to the Discover Page')

      click_on("Return to the Discover Page")
      # - a button to return to the Discover Page

      expect(current_path).to eq("/users/#{user.id}/discover")

      # I should also see the following information about the movie:

      # - Movie Title
      # - Vote Average of the movie
      # - Runtime in hours & minutes
      # - Genre(s) associated to movie
      # - Summary description
      # - List the first 10 cast members (characters & actress/actors)
      # - Count of total reviews
      # - Each review's author and information

    end
  end
end

