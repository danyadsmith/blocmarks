class AddUserToBookmarks < ActiveRecord::Migration
  def change
    # To Do: Add a reference to Users to record who created the bookmark
    add_column :bookmarks, :user_id, :integer
    add_index :bookmarks, :user_id
  end
end
