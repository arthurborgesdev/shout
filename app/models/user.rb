class User < ApplicationRecord
  has_many :yells, foreign_key: 'author_id'
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
end
