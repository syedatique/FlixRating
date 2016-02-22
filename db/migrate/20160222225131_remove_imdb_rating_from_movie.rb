class RemoveImdbRatingFromMovie < ActiveRecord::Migration
  def change
    remove_column :movies, :imdb_rating, :integer
  end
end
