class BadgeRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(staff_id: @user.id).or(scope.where(student_id: @user.id))
    end
  end

  def create?
    @user.active? && @user == @record.student
  end

  def destroy?
    @record.student == @user || @user.has_role?(:school_admin)
  end

  def update?
    @record.staff == @user || @user.has_role?(:school_admin)
  end

end
