class BookmarkPolicy < ApplicationPolicy

  def update?
    user.present?
  end

  def destroy?
    user.present? && (record.topic.user == user)
  end

end