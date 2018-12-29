# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && record.present? && (record.user_id == user.id) || admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && record.present? && admin?
  end
end
