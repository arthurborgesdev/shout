class Following < ApplicationRecord
  validates :followers, :followeds, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'followed_id'
  belongs_to :author, class_name: 'User', foreign_key: 'follower_id'
end
