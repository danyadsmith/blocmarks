class PopulateVoteCount < ActiveRecord::Migration
  def up
    Bookmark.find_each { |bookmark| Bookmark.reset_counters(bookmark.id, :votes) }
  end
end
