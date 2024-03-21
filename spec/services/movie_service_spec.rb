require 'rails_helper'

describe MovieService do
  it "returns movie data", :vcr do

    # require 'pry'; binding.pry
    search = MovieService.new.top_rated_movies
    expect(search).to be_a Hash
    expect(search[:results]).to be_an Array
    movie_data = search[:results].first

    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)

    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)

    expect(movie_data).to have_key :vote_count
    expect(movie_data[:vote_count]).to be_a(Integer)

    expect(movie_data).to have_key :adult
    # expect(movie_data[:adult]).to be_a(Boolean)

  end

  it 'has a search by title', :vcr do
    title = "Grown ups"
    search_results = MovieService.new.search_by_title(title)
    # require 'pry'; binding.pry

    expect(search_results).to be_a Hash

  end
end