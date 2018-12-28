# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  paginates_per 6
  validates :role, presence: true
  has_many :posts, dependent: :destroy
end
