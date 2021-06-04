class Yell < ApplicationRecord
  validates :text, presence: true, length: { maximum: 140 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
