class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.integer :user_id
      t.datetime :time_posted
      t.string :status
      t.integer :on_wall_of_user

      t.timestamps
    end
  end
end
