class User < ApplicationRecord

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  paginates_per 6       
  has_many :posts, dependent: :destroy       
end
