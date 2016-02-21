class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.integer :release_year
      t.text    :plot
      t.string  :director
      t.string  :stars
      t.integer :vote
      t.integer :imdb_rating
      t.string  :imdb_id
      t.string  :poster_url

      t.timestamps null: false
    end
  end
end
