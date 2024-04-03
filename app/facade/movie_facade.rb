class MovieFacade

  def top_rated_movies
    MovieService.new.top_rated_movies[:results]
    # require 'pry'; binding.pry
  end
  
  def self.search_by_title(title)
    MovieService.new.search_by_title(title)[:results]
  end

  def self.movie_details(movie_id)
    MovieService.new.movie_details(movie_id)
  end


end

# def initialize
#   @movie_service = MovieService.new
# end

# def self.top_rated_movies
#   @movie_service.top_rated_movies[:results]
# end

# def self.search_by_title(title)
#   @movie_service.search_by_title(title)[:results]
# end

