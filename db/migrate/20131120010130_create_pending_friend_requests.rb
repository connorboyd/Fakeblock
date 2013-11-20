class CreatePendingFriendRequests < ActiveRecord::Migration
  def change
    create_table :pending_friend_requests do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.datetime :date_requested

      t.timestamps
    end
  end
end
