require "rails_helper"

RSpec.describe Movie do
  it "exists" do
    attrs = {
      title: "Movie name",
      vote_average: "300",
      id: "1"
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Movie name")
    expect(movie.vote_average).to eq("300")
    expect(movie.id).to eq("1")
  end
end