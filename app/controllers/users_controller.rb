class UsersController < ApplicationController

  def show
    @my_bookmarks = current_user.bookmarks
    @my_likes = current_user.votes.map(&:bookmark)

  end

end