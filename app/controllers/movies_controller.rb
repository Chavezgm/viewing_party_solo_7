class MoviesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    
    @movies = if params[:title].nil? 
      MovieFacade.top_rated_movies
      
    else 
      MovieFacade.search_by_title(params[:title])
    end
    # require 'pry'; binding.pry

  end

  def show 

    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
    # require 'pry'; binding.pry
    # need the user ID and the movie ID for the button 
  end
end








# def index
  # @user = User.find(params[:user_id])
  # movie_facade = MovieFacade.new
  
  # @movies = if params[:title].nil? 
  #   movie_facade.top_rated_movies
  # else 
  #   movie_facade.search_by_title(params[:title])
  # end