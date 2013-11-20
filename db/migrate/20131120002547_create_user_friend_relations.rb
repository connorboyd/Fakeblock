class CreateUserFriendRelations < ActiveRecord::Migration
  def change
    create_table :user_friend_relations do |t|
      t.integer :user_id1
      t.integer :user_id2

      t.timestamps
    end
  end
end
