class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :follower, references: :users, index: true
      t.references :followed, references: :users, index: true

      t.timestamps
    end
  end
end
