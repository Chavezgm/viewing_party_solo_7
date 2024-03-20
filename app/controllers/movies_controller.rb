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
end