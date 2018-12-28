# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  
  def index?
    admin?
  end

  def create?
    admin?
  end

  def new?
    create?
  end

  def destroy?
    admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
