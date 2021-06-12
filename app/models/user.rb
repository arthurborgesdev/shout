class User < ApplicationRecord
  validates :username, :full_name, presence: true
  validates :username, uniqueness: true

  has_many :yells, foreign_key: 'author_id'
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'

  mount_uploader :photo, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
