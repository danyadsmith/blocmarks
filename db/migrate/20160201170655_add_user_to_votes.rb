class AddUserToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer, default: 0
  end
end
