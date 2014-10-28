class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end

  def self.find_in_tmdb(query)
  	# search db
    Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")
    selected_movies = Tmdb::Movie.find(query)

    # make hash
    movies_found = []
  	selected_movies.each do |movie|
	  movie_hash = {
	    :tmdb_id => movie.id,
	    :title => movie.title,
	    :release_date => movie.release_date,
	    :rating => 'R' # why doesn't the Tmdb::Movie.detail method return a rating?
	  }
	  movies_found.push(movie_hash)
	end

	# return hash
  	return movies_found
  end

  def self.create_from_tmdb(id)
  	# get the movie details
  	Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")
  	tmdb_movie = Tmdb::Movie.detail(id)

  	# add the movie if it does not exist
  	if(!(Movie.exists?( :title => tmdb_movie.title )))
  		new_movie = Movie.create!( 
  			:title => tmdb_movie.title,
  			:release_date => tmdb_movie.release_date,
  			:rating => 'R'
  		)
  	end
  end
end
