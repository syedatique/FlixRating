class AddMetascoreToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :metascore, :float
  end
end
