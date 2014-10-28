Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  post '/movies/search_tmdb'
  post '/movies/search_tmdb', to: 'movies#add_tmdb', as: 'tmdb_movies_add'
end
