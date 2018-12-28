class Admin::PostPolicy < ApplicationPolicy
	attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

	def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present? && admin? || copywriter?
  end

  def new?
    create?
  end

  def update?
    user.present? && admin? || copywriter?
  end

  def edit?
    update?
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
