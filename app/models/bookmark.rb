class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :votes, dependent: :destroy

  def has_favorite_for(user)
    vote = Vote.where(bookmark: self, user: user).first
    !vote.nil?
  end

  def favorite_for(user)
    vote = Vote.where(bookmark: self, user: user).first
    votes.create(user: user) unless has_favorite_for(user)
    #votes.create
  end

  def delete_favorite_for(user)
    vote = Vote.where(bookmark: self, user: user).first
    vote.destroy if has_favorite_for(user)
    #votes.last.destroy unless votes.empty?
  end
end
