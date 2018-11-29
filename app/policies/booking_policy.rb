class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user
  end

  def accept?
    user == record.player.user
  end

  def decline?
    user == record.player.user
  end
end
