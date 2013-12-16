class RemoveRedundantColumns < ActiveRecord::Migration
  def change
  	remove_column("users", "user_id")
  	remove_column("pending_friend_requests", "date_requested")
  end
end
