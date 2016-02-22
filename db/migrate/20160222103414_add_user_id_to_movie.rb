class AddUserIdToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :user_id, :integer
    add_column :movies, :category_id, :integer
  end
end
