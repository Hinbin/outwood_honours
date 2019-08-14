class BadgePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(active: true)
    end
  end

  def show?
    @user.active?
  end

  def update?
    @user.has_role?(:badge_editor)
  end

end
