class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # Dans pundit, on a accès 2 choses:
    # record -> @restaurant
    # user -> current_user
    user_admin_or_owner?
  end

  def destroy?
    # Scenario 1: Restaurant Owner
    # update?
    # Scenario 2: Restaurant Owner ou Admin
    user_admin_or_owner?

  end

  private
  def user_admin_or_owner?
    user.admin || user == record.user
  end

end
