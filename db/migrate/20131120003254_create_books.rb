class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.int :user_id
      t.string :book_names

      t.timestamps
    end
  end
end
