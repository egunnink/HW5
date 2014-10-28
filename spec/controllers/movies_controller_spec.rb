require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do
  	it 'should call the model method that performs the TMDb search' do
  	  Movie=double(Movie)
  	  fake_results=[double('movie1'), double('movie2')]
  	  expect(Movie).to receive(:find_in_tmdb.with('Ted').
  	    and_return(fake_results))
  	  post :search_tmdb, {:search_terms => 'Ted'}
  	end
  	it 'should select the search result template for rendering' do
  	  Movie=double(Movie)
  	  allow(Movie).to receive(:find_in_tmdb)
  	  post :search_tmdb, { :search_terms => 'Ted' }
  	  expect(response).to render_template('search_tmdb')
  	end
  	it 'should make the TMDb search result available on that template' do
      Move=double(Movie)

  	end
  end
end