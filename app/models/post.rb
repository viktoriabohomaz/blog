# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_punchable
  paginates_per 6

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader
  validates :title, :description, presence: true
  belongs_to :user, counter_cache: true

  def should_generate_new_friendly_id?
    title_changed?
  end
end
