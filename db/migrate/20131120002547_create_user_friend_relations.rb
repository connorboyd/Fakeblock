class CreateUserFriendRelations < ActiveRecord::Migration
  def change
    create_table :user_friend_relations do |t|
      t.int :user_id1
      t.int :user_id2

      t.timestamps
    end
  end
end
