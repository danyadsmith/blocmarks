class AddVotesCountToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :votes_count, :integer, default: 0
  end
end
