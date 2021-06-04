class User < ApplicationRecord
  has_many :yells, foreign_key: 'author_id'
end
