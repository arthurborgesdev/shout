class Following < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :author, class_name: 'User', foreign_key: 'followed_id'
end
