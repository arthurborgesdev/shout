class Following < ApplicationRecord
  belongs_to :followed, class_name: 'User', foreign_key: 'followed_id'
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'

  scope :not_followed_by, ->(user) { where.not(followed_id: user) }
end
