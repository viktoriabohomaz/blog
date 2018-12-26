class Post < ApplicationRecord
	acts_as_punchable
	paginates_per 6

	extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader
  
  def should_generate_new_friendly_id?
    title_changed?
  end	
end
