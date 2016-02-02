class BookmarkPolicy < ApplicationPolicy

  def update?
    user.present?
  end

end