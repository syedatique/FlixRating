class AddMovieRatingToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :movie_rating, :float
  end
end
