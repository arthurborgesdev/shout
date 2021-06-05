class RemoveForeignKeyFromFollowings < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :followings, column: :followed_id
    remove_foreign_key :followings, column: :follower_id
  end
end
